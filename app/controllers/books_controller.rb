class BooksController < ApplicationController
  
  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if@book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book)
    else
      @user = User.find(current_user.id)
      @current_user = current_user 
      @books = Book.all
      render :index
    end
  end
  
  def edit
    @book = Book.find(params[:id])
    user = User.find(@book.user_id)
    unless user == current_user
    redirect_to books_path
    end
  end
  
  def update
    book = Book.find(params[:id])
    if book.update(book_params)
       flash[:notice] = "You have updated book successfully."
       redirect_to book_path(book.id)
    else
       @book = book
       render :edit
    end
  end

  def index
    @user = User.find(current_user.id)
    @current_user = current_user 
    @books = Book.all
    @book = Book.new
  end

  def show
    # @user = User.find(current_user.id)
    @book = Book.find(params[:id])
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to "/books"
  end
  
   private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end