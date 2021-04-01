class UsersController < ApplicationController
  before_action :authenticate_user!
  # ログイン済ユーザーのみにアクセスを許可する
  # コントローラーの先頭に記載することで、そこで行われる処理はログインユーザーによってのみ実行可能となる

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

    if @user.update(user_params)
      flash[:success] = "User was successfully updated."
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


end
