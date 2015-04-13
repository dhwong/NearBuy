class Api::SessionController < Api::BaseController

  before_action 

  def create
    @current_user
  end

  def destroy
    @current_user = session[:current_user_id] = nil
  end



  private

  def current_user
    @current_user ||= session[:current_user_id] &&
      User.find_by(id: session[:current_user_id])
  end

  def require_login
    User.authenticate(:password_confirmation)
  end

end