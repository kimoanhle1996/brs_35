class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  # def create
  #   @comment = Comment.create(params_comment)
  #   if @comment.save
  #     respond_to do |format|
  #       format.js
  #     end
  #   else
  #     render root_path
  #   end
  #  end


  def create
    @comment = Comment.create(params_comment)
    if @comment.save
      #flash[:info] = t "thank"
      redirect_to requests_path
    else
      flash[:danger] = "no"
    end

  end

  private

  def params_comment
    params.require(:comment).permit(:detail, :review_id, :user_id)
  end
end
