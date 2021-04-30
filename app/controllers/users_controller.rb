class UsersController < ApplicationController

  def index
    @users = User.page(params[:page]).reverse_order
  end

  def show
    @user =User.find(params[:id])
    @books = @user.books.page(params[:page]).reverse_order
  end

end
