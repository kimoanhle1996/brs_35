class CatagoriesController < ApplicationController
  def new
    @catagory = Catagory.new
  end

  def index
    @catagories = Catagory.all
  end

  def show
    @catagories = Catagory.all
    @catagory = Catagory.find_by id: params[:id]
    @books = @catagory.books
  end

  def create
    @catagory = Catagory.new catagory_params
    if @catagory.save
      flash[:info] = t "successfully"
      redirect_to catagories_path
    else
      flash[:danger] = t "not"
    end
  end

  private

  def catagory_params
    params.require(:catagory).permit(:name)
  end
end
