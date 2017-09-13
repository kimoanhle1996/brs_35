class StaticHomeController < ApplicationController
  def index
    @catagory = Catagory.all
    @book = Book.all
  end
end
