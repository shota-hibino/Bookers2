class UsersController < ApplicationController
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(current_user.id), notice: 'You have created book successfully'
    else
      @user = current_user
      @books = @user.books
      render :index
    end
  end

  def edit
      @user = User.find(params[:id])
      @books = @user.books

      if current_user == @user
        render action: :edit
      else
        redirect_to user_path(current_user.id)
      end
  end

  def index
    @users = User.all
    @user = User.new
    @books = Book.all
    @book = Book.new
    @book.user_id = current_user.id
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book_new = Book.new
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: 'You have updated user successfully'
    else
      render :edit
    end
  end

  private
  def book_params
    params.require(:book).permit(:image, :title, :body)
  end

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
