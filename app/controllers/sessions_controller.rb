class SessionsController < ApplicationController
  def create
    @user = User.find_or_create_by_auth(request.env["omniauth.auth"])
    if @user
      session[:user_id] = @user.id
      redirect_to dashboard_path
      flash[:success] = "Welcome #{@user.name}!"
    else
      redirect_to root_path
      flash[:warning] = "Try again!"
    end
  end

  def destroy
    if current_user
      session.destroy
      flash[:success] = "You have successfully logged out"
    end
    redirect_to root_path
  end
end
