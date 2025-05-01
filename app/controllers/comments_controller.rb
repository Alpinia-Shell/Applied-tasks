class CommentsController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    @comment = book.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to book_path(book)
    else
    @book = Book.find(params[:book_id])
    @book_new = Book.new
    @user = @book.user
    render "books/show"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
  end
  
  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
