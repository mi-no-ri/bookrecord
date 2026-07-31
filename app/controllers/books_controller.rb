class BooksController < ApplicationController
  before_action :require_login
  # 一覧画面
  def index
  # ログインしているユーザーが登録した書籍を取得する
  @books = current_user.books

  # 検索ワードが入力されている場合
  if params[:keyword].present?
    # タイトルまたは著者にキーワードを含む本を取得する
    @books = @books.where(
      "title LIKE ? OR author LIKE ?",
      # 検索対象が2つあるため
      "%#{params[:keyword]}%",
      "%#{params[:keyword]}%"
    )
  end

  # 読書状況が選択されている場合
  if params[:reading_status].present?
    # 選択された読書状況の本だけに絞り込む
    @books = @books.where(
      reading_status: params[:reading_status]
    )
  end

  # 入手方法が選択されている場合
  if params[:acquisition_type].present?
    # 選択された入手方法の本だけに絞り込む
    @books = @books.where(
      acquisition_type: params[:acquisition_type]
    )
  end

  # 媒体が選択されている場合
  if params[:medium].present?

    # 紙書籍が選択された場合
    if params[:medium] == "paper"
      # paperがtrueの本だけを取得する
      @books = @books.where(paper: true)
    # 電子書籍が選択された場合
    elsif params[:medium] == "ebook"
      # ebookがtrueの本だけを取得する
      @books = @books.where(ebook: true)
    end
  end

    # 読書状況ごとの冊数のカウント
    @unread_count = current_user.books.unread.count
    @reading_count = current_user.books.reading.count
    @finished_count = current_user.books.finished.count
  end

  # 詳細画面
  def show
    @book = current_user.books.find(params[:id])
  end

  # 新規登録画面
  def new
    @book = current_user.books.new
  end

  # 書籍を登録
  def create
    @book = current_user.books.new(book_params)

    if @book.save
      # 登録成功時は詳細画面へ移行
      redirect_to @book, notice: "書籍を登録しました"
    else
      # 失敗時は登録画面を再表示
      render :new, status: :unprocessable_entity
    end
  end

  # 編集画面
  def edit
    @book = current_user.books.find(params[:id])
  end
  # 書籍情報を更新
  def update
    @book = current_user.books.find(params[:id])

    if @book.update(book_params)
      # 更新成功時は詳細画面へ移行
      redirect_to @book, notice: "更新しました"
    else
      # 失敗時は編集画面を再表示
      render :edit, status: :unprocessable_entity
    end
  end

  # 書籍を削除
  def destroy
    @book = current_user.books.find(params[:id])
    @book.destroy

    # 削除後、一覧画面へ移行
    redirect_to books_path, notice: "削除しました", status: :see_other
  end

  private

  # フォームから送信されたbookデータのうち、保存を許可する項目
  def book_params
    params.require(:book).permit(
      :title,
      :author,
      :started_on,
      :finished_on,
      :reading_status,
      :acquisition_type,
      :paper,
      :ebook,
      :memo
    )
  end
end
