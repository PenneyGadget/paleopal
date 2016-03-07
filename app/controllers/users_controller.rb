class UsersController < ApplicationController
  def show
    if current_user
      @user = current_user
    else
      unauthenticated_user_error
    end
  end
end
