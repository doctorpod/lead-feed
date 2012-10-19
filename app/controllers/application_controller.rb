class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
  
  def authorise(user, redirect_path = root_path)
    unless user == current_user
      redirect_to redirect_path, :notice => 'Unauthorised action'
    end
  end
end
