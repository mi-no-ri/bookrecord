require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
   @user = users(:one)

    # ログイン
    post login_path, params: {
      email: @user.email,
      password: "password"
    }


    @book = books(:one)
  end

  test "should get index" do
    get books_url
    assert_response :success
  end

  test "should get show" do
    get book_url(@book)
    assert_response :success
  end

  test "should get new" do
    get new_book_url
    assert_response :success
  end

  test "should create book" do
    assert_difference("Book.count") do
      post books_url, params: {
        book: {
          title: "テスト本",
          author: "テスト著者",
          started_on: Date.today,
          finished_on: Date.today,
          reading_status: :reading,
          acquisition_type: :purchase,
          paper: true,
          ebook: false,
          memo: "テスト"
        }
      }
    end

    assert_redirected_to book_path(Book.last)
  end
  test "should get edit" do
    get edit_book_url(@book)
    assert_response :success
  end

  test "should get update" do
    get book_url(@book)
    assert_response :success
  end

  test "should get destroy" do
    get book_url(@book)
    assert_response :success
  end
end
