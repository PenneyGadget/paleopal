class EntriesController < ApplicationController
  def new
    @entry = Entry.new
  end

  def create
    # do stuff here
    # binding.pry
    ns = NutritionService.new
    nutrients = ns.get_nutrition_values(params["entry"]["ingredients"])
    params["entry"]["protein"] = nutrients
    # @entry = Entry.create(entry_params)
    # if @entry.save
      # validations
      # NutritionService.new
      # API needs to gather info based on ingredients - parse as you need (meal becomes 3 nutrient columns)
      # return to controller so it can save to db
      # (class?) DayEntries (does day exist? add values? -)
      # need to add day_id to entry values - need to first check if a day already exists in Days table
      # if it does, pull out current nutrient values and add to it and use that day_id
      # if it doesn't, add a new day to Days table with just that meal, and add new day_id to entry_params
      # Entry.save
      redirect_to dashboard_path
    # else
    #   flash.now[:error] = @entry.errors.full_messages.join(", ")
    #   render :new
    # end
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
                                  :day_id)
  end
end
