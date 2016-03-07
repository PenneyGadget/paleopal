class EntriesController < ApplicationController
  def new
    @entry = Entry.new
  end

  def create
    
    @entry = Entry.create(entry_params)
    @entry.user_id = current_user.id
    if @entry.save
      meal_data = { ingredients: params["entry"]["ingredients"].split(/ *, */) }
      calc_nutrients(meal_data)
      redirect_to dashboard_path
      flash[:success] = "New meal logged!"
    else
      flash[:error] = @entry.errors.full_messages.join(", ")
      redirect_to new_entry_path
    end
  end

  def show
    @entry = Entry.find(params[:id])
  end

  def calc_nutrients(meal_data)
    ns = NutritionService.new
    nutrients = ns.get_nutrition_values(meal_data)
    summed_nutrients = Macronutrients.sum_macronutrients(nutrients)
    @entry.update_attributes(summed_nutrients)
    @entry.save
  end

  def get_api_nutrients
    if params[:ingredients]
      meal_data = { ingredients: params[:ingredients].split(/ *, */) }
      ns = NutritionService.new
      nutrients = ns.get_nutrition_values(meal_data)
      summed_nutrients = Macronutrients.sum_macronutrients(nutrients)
      render :json => { :result => 'success', :nutrients => summed_nutrients }
    else
      flash[:error] = "You don't belong here."
      redirect_to new_entry_path
    end
  end

  private

  def entry_params
    params.require(:entry).permit(:date,
                                  :meal,
                                  :ingredients,
                                  :fat,
                                  :carbs,
                                  :protein,
                                  :notes,
                                  :user_id)
  end
end
