class BooksController < ApplicationController
  # 一覧画面
  def index
    @books = Book.all
  end

  # 詳細画面
  def show
    @book = Book.find(params[:id])
  end

  # 新規登録画面
  def new
    @book = Book.new
  end

  # 書籍を登録
  def create
    @book = Book.new(book_params)

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
    @book = Book.find(params[:id])
  end
  # 書籍情報を更新
  def update
    @book = Book.find(params[:id])

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
    @book = Book.find(params[:id])
    @book.destroy

    # 削除後、一覧画面へ移行
    redirect_to books_path, notice: "削除しました", status: :see_other
  end

  private

  # フォームから送信されたbookデータのうち、保存を許可する項目
  def book_params
        params.require(:book).permit(:title, :author, :started_on, :finished_on, :reading_status, :acquisition_type, :paper, :ebook, :memo)
  end
end
