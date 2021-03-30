class BooksController < ApplicationController

  def new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    # セーブ直前の行に記述する→保存の前にユーザーIDと関連しているという記述をすることで連動する
    @book.save
    redirect_to book_path(@book.id)
  end

  def index
    @user = current_user
    # 現在ログインしているユーザーの情報を取得できるメソッド

    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @books = Book.all

    @user = @book.user
    # 本の投稿者が誰なのか
    @booknew = Book.new
  end

  def edit
    @book = Book.find(params[:id])
    render layout: false #application.html.erbを適用させたくない
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    # 動作の確認　何をしているか
    redirect_to book_path(@book.id)
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
    # 一覧画面へ遷移させたい
    # 一覧画面へ遷移させた後、文字の表示をさせたい
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
    #  データベースからデータを取得
  end

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
