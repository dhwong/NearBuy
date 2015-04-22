class Api::UsersController < Api::BaseController
  # before_filter :correct_user, only: :show
  # ^^ To use for verifying the user

  def index
    render :json => users
  end

  def show
    render :json => user
  end

  def create
    User.create(user_params)
    render :json => user
  end

  def update
    User.update(user_params)
    render :json => user
  end

  def destroy
    user.destroy
    render :json => { :response => "User deleted" }
  end

  private

    def users
      @users ||= User.all
    end

    def user
      @user ||= users.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :fname, :lname, :isOwner,
                                  :password, :password_confirmation)
    end
    
end
