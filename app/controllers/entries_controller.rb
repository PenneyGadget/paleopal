class EntriesController < ApplicationController
  before_action :check_user, only: [:show, :edit]

  def new
    if current_user
      @entry = Entry.new(date: Date.today)
      @entry.meal = params["meal"] if params["meal"]
      @entry.date = params["date"] if params["date"]
    else
      unauthenticated_user_error
    end
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
    check_user
  end

  def edit
    check_user
  end

  def update
    if current_user
      @entry = Entry.find(params[:id])
      @entry.update_attributes(entry_params)
      meal_data = { ingredients: params["entry"]["ingredients"].split(/ *, */) }
      calc_nutrients(meal_data)
      flash[:success] = "Meal updated"
      redirect_to entry_path(@entry)
    else
      unauthenticated_user_error
    end
  end

  def destroy
    if current_user
      @entry = Entry.find(params[:id])
      @entry.destroy
      flash[:warning] = "Meal deleted"
      redirect_to dashboard_path
    else
      unauthenticated_user_error
    end
  end

  def get_api_nutrients
    if params[:ingredients]
      meal_data = { ingredients: params[:ingredients].split(/ *, */) }
      ns = NutritionService.new
      nutrients = ns.get_nutrition_values(meal_data)
      if nutrients[:result] == "error"
        render :json => { :result => "error", :message => nutrients[:message] }
      else
        summed_nutrients = Macronutrients.sum_macronutrients(nutrients[:response])
        render :json => { :result => "success", :nutrients => summed_nutrients }
      end
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

  def calc_nutrients(meal_data)
    ns = NutritionService.new
    nutrients = ns.get_nutrition_values(meal_data)
    summed_nutrients = Macronutrients.sum_macronutrients(nutrients[:response])
    @entry.update_attributes(summed_nutrients)
    @entry.save
  end

  def check_user
    if current_user
      @entry = Entry.find(params[:id])
    else
      unauthenticated_user_error
    end
  end
end
