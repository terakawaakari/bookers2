class BooksController < ApplicationController

  def index
    @books = Book.all
    @book = Book.new
    @user_id = current_user
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to books_path, notice:'You have created book successfully.'
    else
      render :index
    end
    @user_id = current_user
  end

  def show
    @book_find = Book.find(params[:id])
    @user = current_user
    @user_id = current_user
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
    @user_id = current_user
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id), notice:"You have updated book successfully."
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title,:body)
  end

end
