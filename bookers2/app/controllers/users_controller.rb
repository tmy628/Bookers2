class UsersController < ApplicationController
  before_action :authenticate_user!
  # ログイン済ユーザーのみにアクセスを許可する
  # コントローラーの先頭に記載することで、そこで行われる処理はログインユーザーによってのみ実行可能となる
  before_action :correct_user, only: [:edit, :update]
  # サインインしているユーザーを取得する

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

    if @user.update(user_params)
      flash[:success] = "You have updated user successfully."
      # サクセスメッセージを表示
      redirect_to user_path(@user.id)
    else
      render action: :edit
    end
  end

  def create
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def correct_user
    @user = User.find(params[:id])
    if current_user != @user
       redirect_to user_path(current_user.id)
    end
  end
end
