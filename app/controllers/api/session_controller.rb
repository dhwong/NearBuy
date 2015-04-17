class Api::SessionController < Api::BaseController

  before_action :require_login

  def create
    user = @current_user.authenticate(params[:password])
    session[:current_user_id] = user.id
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
    user = @current_user.authenticate(params[:password])
  end

  def user_params
    params.permit(:password)
  end
end