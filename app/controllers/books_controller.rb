class BooksController < ApplicationController
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save

    redirect_to user_path(current_user.id)
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @book = Book.find(params[:id])
  end

  def destroy
  end

  private
  def book_params
    params.require(:book).permit(:image, :title, :body)
  end
end
