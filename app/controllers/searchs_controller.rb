class SearchsController < ApplicationController
  def index
    @catagory = Catagory.all
    @search = Book.search(params[:term])
  end
end
