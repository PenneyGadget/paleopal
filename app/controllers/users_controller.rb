class UsersController < ApplicationController
  def show
    if current_user
      @presenter = DashboardPresenter.new(current_user)
    else
      unauthenticated_user_error
    end
  end
end
