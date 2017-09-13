class LoginController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        params[:session][:remember_me] == Settings.remember ? remember(user) : forget(user)
        redirect_to root_url
      else
        message  = t "accountnot "
        message += t "check"
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = I18n.t "invalidd"
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end
end
