require "test_helper"
require "minitest/reporters"
require_relative '../helpers/NewUserHelper.rb'
require_relative '../helpers/NewOrganizationHelper.rb'
require_relative '../helpers/NewPostHelper.rb'

Minitest::Reporters.use!


class PostsControllerTest < ActionDispatch::IntegrationTest
  include NewUserHelper
  include NewOrganizationHelper
  include NewPostHelper

  setup do
    new_user()
    Searchkick.enable_callbacks
    organization_name = Faker::Company.name
    new_organization(organization_name)
    @organization = Organization.find_by(name: organization_name)
    personal_post_title = "Post #1"
    new_post(personal_post_title, nil)
    @personal_post = Post.find_by(title: personal_post_title)
    organization_post_title = "Post #2"
    new_post(organization_post_title, @organization.id)
    @organization_post = Post.find_by(title: organization_post_title)
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
  
  test "should get personal post edit view" do
    get "/posts/#{@personal_post.id}/edit"
    assert_response :success
    assert_template "edit"
  end

  test "should get organization post edit view" do
    get "/posts/#{@organization_post.id}/edit"
    assert_response :success
    assert_template "edit"
  end

  test "should get new view" do
    get "/posts/new"
    assert_response :success
    assert_template "new"
  end

end
