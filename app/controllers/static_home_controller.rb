class StaticHomeController < ApplicationController
  def index
    @catagories = Catagory.all
    @books = Book.all
  end
end
