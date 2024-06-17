class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
    @current_user = current_user
    @books = @user.books
  end
  
  def index
    @user = User.find(current_user.id)
    @books = Book.all
    @users =User.all
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
  
end
