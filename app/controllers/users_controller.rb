class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:info] = I18n.t "welcome"
      redirect_to root_url
    else
      redirect_to signup_path
    end
  end

  def edit

   end

  private

  def user_params
    params.require(:user).permit(:fullname, :email, :password, :password_confirmation)
  end
end
