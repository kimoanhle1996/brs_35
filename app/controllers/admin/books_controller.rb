class Admin::BooksController < ApplicationController
  before_action :load_book, only: %i(edit update destroy )
  before_action :logged_in_user
  before_action :admin_user
  def index
   @books = Book.paginate(page: params[:page], :per_page => 10)
  end

  def new
    @book = Book.new
  end

  def create
   @book = Book.new book_params
    if @book.save
      flash[:info] = t "successfully"
      redirect_to admin_books_path
    else
      flash[:danger] = t "not"
    end
  end

  def edit
    if @book.blank?
      byebug
      flash[:danger] = I18n.t "does"
      redirect_to admin_books_path
    end
  end

  def update
    if @book.update_attributes(book_params)
      flash[:success] = I18n.t "profile"
      redirect_to admin_books_path
    else
      flash[:danger] = I18n.t "does"
    end
  end

  def destroy

  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :publish_date, :page_number,
      :preview, :detail, :picture, :rate, :catagory_id)
  end

  def load_book
    @book = Book.find_by id: params[:id]
    return if @book
    redirect_to admin_books_path
  end
end
