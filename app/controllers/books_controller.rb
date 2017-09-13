class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def index
    @books = Book.all
  end

  def show
    @catagories = Catagory.all
    @book = Book.find_by id: params[:id]
  end

  def create
    @book = Book.new book_params
    if @book.save
      flash[:info] = t "successfully"
      redirect_to books_path
    else
      flash[:danger] = t "not"
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :publish_date, :page_number,
      :preview, :detail, :picture, :rate, :catagory_id)
  end
end
