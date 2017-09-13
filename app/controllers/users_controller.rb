class UsersController < ApplicationController
  before_action :load_user, only: %i(edit update)
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      @user.send_activation_email
      flash[:info] = t "please"
      redirect_to root_url
    else
      render :new
    end
  end

  def show; end

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
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    User.find(params[:id]).destroy
    flash[:success] = I18n.t "delete"
    redirect_to users_url
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
