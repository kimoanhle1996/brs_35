class SearchsController < ApplicationController
  def index
    @catagories = Catagory.all
    @search = Book.search(params[:term])
  end
end
