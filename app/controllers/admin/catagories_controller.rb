class Admin::CatagoriesController < ApplicationController
  before_action :load_catagory, only: %i(edit update destroy )
  before_action :logged_in_user
  before_action :admin_user
  def index
     #@catagorys = Catagory.all
     @catagories = Catagory.paginate(page: params[:page], :per_page => 5)
  end

  def new
    @catagory = Catagory.new
  end

  def create
    @catagory = Catagory.new catagory_params
    if @catagory.save
      flash[:info] = t "successfully"
      redirect_to admin_catagories_path
    else
      flash[:danger] = t "not"
    end
  end

  def edit
   if @catagory.blank?
      flash[:danger] = I18n.t "does"
      redirect_to admin_catagories_path
    # else
    #   @catagory
    end
  end

  def update
    if @catagory.update_attributes(catagory_params)
      flash[:success] = I18n.t "profile"
      redirect_to admin_catagories_path
    else

    end
  end

  def destroy
    @catagory.destroy
    flash[:success] = I18n.t "delete"
    redirect_to admin_catagories_path
  end

  private

  def load_catagory
    @catagory = Catagory.find_by id: params[:id]
    return if @catagory
    redirect_to admin_catagories_path
  end

  def catagory_params
    params.require(:catagory).permit(:name)
  end

end
