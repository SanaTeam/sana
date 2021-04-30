require "test_helper"
require "minitest/reporters"
require_relative '../helpers/NewUserHelper.rb'
require_relative '../helpers/NewPostHelper.rb'

Minitest::Reporters.use!


class PostsControllerTest < ActionDispatch::IntegrationTest
  include NewUserHelper
  include NewPostHelper

  setup do
    new_user()
    Searchkick.enable_callbacks
    post_title = Faker::GreekPhilosophers.name
    new_post(post_title, nil)
    @post = Post.find_by(title: post_title)
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
    assert_template "index"
  end

  test "should get show view" do
    get "/posts/1"
    assert_response :success
    assert_template "show"
  end
  
  test "should get edit view" do
    get "/posts/#{@post.id}/edit"
    assert_response :success
    assert_template "edit"
  end

  test "should get new view" do
    get "/posts/new"
    assert_response :success
    assert_template "new"
  end

end
