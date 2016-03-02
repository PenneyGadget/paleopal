class DashboardController < ApplicationController
  def show
    current_user = User.find_by(session[:user_id])
    flash[:notice] = "Welcome #{current_user.name}!"
  end
end
