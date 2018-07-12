class UsersController < ApplicationController
  def index 
    @users = User.all
  end
  
  def create
    @user = User.new(user_params)
    @user.password = params[:password]
    @user.reset_session_token!
    if @user.save
      redirect_to users_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end
  
  def new
    @user = User.new
  end
  
  
  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end