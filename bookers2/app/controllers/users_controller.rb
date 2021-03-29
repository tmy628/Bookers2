class UsersController < ApplicationController

  def index
    @user = current_user

    @users = User.all
    @book = Book.new
    @books = Book.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
    #ユーザー（自分）に関連している本の投稿が羅列されるように
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def create
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end


end
