class UsersController < ApplicationController

  def index

  end

  def new
  end

  def create
    @user = User.create(session_params)
    if @user.authenticate(session_params[:password])
      session[:user_id] = @user.id
      redirect_to new_user_path
    else
      redirect_to users_path
    end
  end

  private

  def session_params
    params.require(:user).permit(:name, :password)
  end

end
