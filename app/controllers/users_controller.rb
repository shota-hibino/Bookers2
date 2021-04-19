class UsersController < ApplicationController
  def create
  end

  def edit
    @user = User.find(params[:id])
  end

  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
  end
end
