class UsersController < ApplicationController
  
  def new
    reset_session
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Welcome to Justin\'s Brazilian Cookery'
    else
      flash[:error] = 'LOGIN FAILED!!!'
      render :new
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end
