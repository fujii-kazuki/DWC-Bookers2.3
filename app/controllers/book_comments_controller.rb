class BookCommentsController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    comment = BookComment.new(book_comment_params)
    comment.user_id = current_user.id
    comment.book_id = book.id
    comment.save
    redirect_back fallback_location: root_path
  end

  def destroy
    comment = BookComment.find(params[:id])
    if comment.user_id == current_user.id
      comment.destroy
    end
    redirect_back fallback_location: root_path
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
