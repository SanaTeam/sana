require "test_helper"
require "minitest/reporters"
Minitest::Reporters.use!

class PostsControllerTest < ActionDispatch::IntegrationTest

  setup do
    help_new_session
  end
 
  test "should get index view" do 
    get posts_url
    assert_response :success
    assert_select "h1", text: "Forum"
  end

  test "should get show view" do
    get "/posts/1"
    assert_response :success
    assert_select "h5", text: "Hello, world!"
  end
  
  test "should get edit view" do
    get "/posts/1/edit"
    assert_response :success
    assert_select "h1", text: "Edit Post"
  end

  test "should get new view" do
    get "/posts/new"
    assert_response :success
    assert_select "h1", text: "New Post"
  end

end
