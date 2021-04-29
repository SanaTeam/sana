require "test_helper"
require "minitest/reporters"
Minitest::Reporters.use!

class PostsControllerTest < ActionDispatch::IntegrationTest

  setup do
    help_new_session
    Searchkick.enable_callbacks
  end
 
  def teardown
    Searchkick.disable_callbacks
  end

  def test_search
    Post.create!(title: "Test Post1", content: "Content for test 1", user_id: User.all.sample.id, pinned: true, is_anonymous: false, organization_id: 2, is_request: true, categories: ["Financial Literacy"])
    Post.search_index.refresh
    assert_equal ["Test Post1"], Post.search("test post1").map(&:title)
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
