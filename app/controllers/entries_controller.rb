class EntriesController < ApplicationController
  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.create(entry_params)
    @entry.user_id = current_user.id
    if @entry.save
      meal_data = { ingredients: params["entry"]["ingredients"].split(/ *, */) }
      ns = NutritionService.new
      nutrients = ns.get_nutrition_values(meal_data)
      summed_nutrients = Macronutrients.sum_macronutrients(nutrients)
      @entry.update_attributes(summed_nutrients)
      @entry.save
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

  private

  def entry_params
    params.require(:entry).permit(:date,
                                  :meal,
                                  :ingredients,
                                  :notes,
                                  :user_id)
  end
end
