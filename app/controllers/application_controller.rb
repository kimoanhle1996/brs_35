class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include LoginHelper

  def correct_user
    @user = User.find_by id: params[:id]
    redirect_to(root_url) unless current_user?(@user)
  end

  def admin_user
    return if current_user.role?
    flash[:danger] = t "not"
    redirect_to root_url
  end

  def user_correct
    @user = User.find_by id: params[:id]
    redirect_to(root_url) unless current_user.role?
  end

  def logged_in_user
    return if logged_in?
     session[:forwarding_url] = request.original_url if request.get?
    flash[:danger] = I18n.t "please"
    redirect_to login_url
  end
 end
