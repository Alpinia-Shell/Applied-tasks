class FavoritesController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    favorite = current_user.favorites.new
    favorite.book_id = @book.id
    favorite.save
  end

  def destroy
    @book = Book.find(params[:book_id])
    current_user.favorites.find_by(book_id: @book.id).destroy
  end
end
