class RequestsController < ApplicationController
  before_action :load_contact, only: %i(destroy)
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
    flash[:success] = I18n.t "delete"

  end

  private

  def contact_params
    params.require(:request).permit(:title, :message, :user_id)
  end

  def load_contact
    @contact = Request.find_by id: params[:id]
    return if @contact
    redirect_to requests_path

  end
end
