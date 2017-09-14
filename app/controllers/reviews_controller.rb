class ReviewsController < ApplicationController
  before_action :logged_in_user
  before_action :load_review, only: %i(edit update destroy)

   def create
    @review = Review.create(params_review)
    if @review.save
      flash[:info] = t "thank"
      redirect_to book_path(@review.book_id)
    else
      flash[:danger] = "no"
    end
  end

  # def edit
  #   if @review.blank?
  #     flash[:danger] = I18n.t "does"
  #     redirect_to reviews_path
  #   end
  # end

  # def update
  #   if @review.update_attributes(params_review)
  #     flash[:success] = I18n.t "profile"
  #     redirect_to @user
  #   else
  #     render :edit
  #   end
  # end

  def destroy
    review = @review.destroy
    flash[:success] = I18n.t "delete"
    redirect_to book_path(review.book)
  end

  private

  def load_review
    @review = Review.find_by id: params[:id]
    return if @review
    redirect_to reviews_path
  end

  def params_review
    params.require(:review).permit(:detail, :book_id, :user_id)
  end

end
