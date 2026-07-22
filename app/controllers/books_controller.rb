class BooksController < ApplicationController
  # 一覧画面
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to @book, notice: "書籍を登録しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(parms[:id])

    if @plan.update
      redirect_to @book, notice: "更新しました"
    else
      render :new, status: :unprocessable_entity

    end
  end

  def destroy
  end

  private

  # フォームから送信されたbookデータのうち、保存を許可する項目
  def book_params
        params.require(:book).permit(:title, :author, :started_on, :finished_on, :reading_status, :acquisition_type, :paper, :ebook, :memo)
  end
end
