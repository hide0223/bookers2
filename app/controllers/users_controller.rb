class UsersController < ApplicationController
  def edit
  end

  def show
    @user = User.find(params[:id])
    @current_user = current_user
    @books = @user.books
  end
  
  def index
   
  end
end
