require "test_helper"

class Public::BookmarksControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_bookmarks_show_url
    assert_response :success
  end
end
