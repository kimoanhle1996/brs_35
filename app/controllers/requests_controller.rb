class RequestsController < ApplicationController
  before_action :logged_in_user, only: %i(create edit new)

  def new
    @contact = Request.new
  end

  def create
    @contact = Request.create(contact_params)
    if @contact.save
      flash[:info] = t "thank"
      redirect_to requests_path
    else
      flash[:danger] = "no"
    end
  end

  def index
    @contact = Request.new
    @contacts = Request.request_user current_user.id
  end

  def destroy
    @contact.destroy

  end

  private

  def contact_params
    params.require(:request).permit(:title, :message, :user_id)
  end
end
