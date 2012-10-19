class UsersController < ApplicationController
  before_filter :authenticate_user!# , :get_user_and_authorise

  def show
  end
  
  def update_hide_won
    current_user.update_attribute(:hide_won, params[:hide_won])
  end
  
  def update_hide_dead
    current_user.update_attribute(:hide_dead, params[:hide_dead])
  end
  
  private
  
  def get_user_and_authorise
    @user = User.find params[:id]
    authorise(@user)
  end
end