class MealService
  attr_reader :current_user

  def initialize(current_user)
    @current_user = current_user
  end

  def get_meal_entry_id(day_entry, meal)
    current_user.entries.where(date: day_entry, meal: meal).pluck("id")
  end

  def meal_data(day_entry, meal)
    data = current_user.entries.where(date: day_entry.date, meal: meal.capitalize).pluck(:fat, :carbs, :protein).flatten
    {fat: data[0], carbs: data[1], protein: data[2]}
  end

  def get_day_totals(day_entry)
    totals = {}
    totals[:fat] = current_user.entries.where(date: day_entry.date).pluck("fat").sum
    totals[:carbs] = current_user.entries.where(date: day_entry.date).pluck("carbs").sum
    totals[:protein] = current_user.entries.where(date: day_entry.date).pluck("protein").sum
    totals
  end
end
