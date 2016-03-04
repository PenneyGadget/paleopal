class EntriesController < ApplicationController
  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.create(entry_params)
    if @entry.save
      meal_data = { ingredients: params["entry"]["ingredients"].split(/ *, */) }
      ns = NutritionService.new
      nutrients = ns.get_nutrition_values(meal_data)
      binding.pry
      # entry is saving to db! BUT it's not associated with the user, and still
      # needs the nutrients added in

    redirect_to dashboard_path
    else
      flash.now[:error] = @entry.errors.full_messages.join(", ")
      render :new
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
                                  :protein,
                                  :carbs,
                                  :fat,
                                  :user_id)
  end
end
