class BooksController < ApplicationController
  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book)
  end

  def index
    @user = User.find(current_user.id)
    @current_user = current_user 
    @books = Book.all
  end

  def show
    @user = User.find(current_user.id)
    @book = Book.find(params[:id])
  end
  
   private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
