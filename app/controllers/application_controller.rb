class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user,
                :unauthenticated_user_error,
                :get_day_entries,
                :day_breakfast,
                :day_lunch,
                :day_dinner,
                :day_snack,
                :get_day_totals

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def unauthenticated_user_error
    render(file: "/public/404") unless current_user
  end

  def get_day_entries
    current_user.entries.select("date").group("date").order(date: :desc)
  end

  def day_breakfast(day_entry)
    data = current_user.entries.where(date: day_entry.date, meal: "Breakfast").pluck(:fat, :carbs, :protein).flatten
    {fat: data[0], carbs: data[1], protein: data[2]}
  end

  def day_lunch(day_entry)
    data = current_user.entries.where(date: day_entry.date, meal: "Lunch").pluck(:fat, :carbs, :protein).flatten
    {fat: data[0], carbs: data[1], protein: data[2]}
  end

  def day_dinner(day_entry)
    data = current_user.entries.where(date: day_entry.date, meal: "Dinner").pluck(:fat, :carbs, :protein).flatten
    {fat: data[0], carbs: data[1], protein: data[2]}
  end

  def day_snack(day_entry)
    data = current_user.entries.where(date: day_entry.date, meal: "Snack").pluck(:fat, :carbs, :protein).flatten
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
