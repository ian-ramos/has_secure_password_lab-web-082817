class UsersController < ApplicationController

  def index

  end

  def new
  end

  def create
    # @user = User.create(user_params)
    # if @user.authenticate(user_params[:password])
    #   session[:user_id] = @user.id
    #   redirect_to new_user_path
    # else
    #   redirect_to users_path
    # end
    if user_params[:password] == user_params[:password_confirmation]
      @user = User.create(user_params)
      session[:user_id] = @user.id
      redirect_to users_path
    else
      redirect_to new_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
