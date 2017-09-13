class CatagoriesController < ApplicationController
  def new
    @catagory = Catagory.new
  end

  def index
    @catagory = Catagory.all
  end

  def show
    @catagory = Catagory.all
    @catagory1 = Catagory.find_by id: params[:id]
    @books = @catagory1.books
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
