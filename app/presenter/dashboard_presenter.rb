class DashboardPresenter < SimpleDelegator
  attr_reader :current_user,
              :get_day_entries,
              :meal_service,
              :meals

  def initialize(current_user)
    @current_user = current_user
    super(meal_service)
  end

  def get_day_entries
    @get_day_entries ||= current_user.entries.select("date").group("date").order(date: :desc)
  end

  def meal_service
    @meal_service ||= MealService.new(current_user)
  end

  def meals
    %w(Breakfast Lunch Dinner Snack)
  end
end
