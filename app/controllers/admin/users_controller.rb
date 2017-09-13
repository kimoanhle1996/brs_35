class Admin::UsersController < ApplicationController
  layout "admin_application"
  before_action :load_user, only: %i(edit update destroy)
  before_action :admin_user, only: %i(destroy)
  before_action :user_correct, only: %i(edit update)
  before_action :logged_in_user, except: %i(new show create)
  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def edit
    if @user.blank?
      flash[:danger] = I18n.t "does"
      redirect_to signup_path
    else
      @user
    end
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = I18n.t "profile"
      redirect_to admin_users_path
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:success] = I18n.t "delete"
    redirect_to admin_users_path
  end

  private

  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    redirect_to loggin_path
  end

  def user_params
    params.require(:user).permit(:fullname, :email, :password, :password_confirmation)
  end
end
