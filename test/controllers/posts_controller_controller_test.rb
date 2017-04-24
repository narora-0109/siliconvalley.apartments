require 'test_helper'

class PostsControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get posts_controller_create_url
    assert_response :success
  end

  test "should get update" do
    get posts_controller_update_url
    assert_response :success
  end

  test "should get delete" do
    get posts_controller_delete_url
    assert_response :success
  end

end
