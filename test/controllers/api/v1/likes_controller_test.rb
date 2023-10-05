require "test_helper"

class Api::V1::LikesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_likes_index_url
    assert_response :success
  end

  test "should get show" do
    get api_v1_likes_show_url
    assert_response :success
  end
end
