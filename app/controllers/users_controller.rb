class UsersController < ApplicationController
  def show
    @user = current_user
    # @meals = current_user.meals -- @meal.each etc. in view
    # @meals = current_user.entries
    #push logic down stack and fetch from models
  end
end
