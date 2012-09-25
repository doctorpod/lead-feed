class UsersController < ApplicationController
  before_filter :authenticate_user!, :get_user_and_authorise

  def show
  end
  
  private
  
  def get_user_and_authorise
    @user = User.find params[:id]
    authorise(@user)
  end
end