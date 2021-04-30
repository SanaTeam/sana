require "test_helper"
require "minitest/reporters"
require_relative '../helpers/NewUserHelper.rb'
require_relative '../helpers/NewPostHelper.rb'
require_relative '../helpers/NewReplyHelper.rb'

class RepliesControllerTest < ActionDispatch::IntegrationTest
    include NewUserHelper
    include NewPostHelper
    include NewReplyHelper

    setup do
        @user_email = new_user()
        @user = User.find_by(email: @user_email)
        post_title = Faker::GreekPhilosophers.name
        new_post(post_title, nil)
        @post = Post.find_by(title: post_title)
    end
  
    test "post with no replies" do
        get "/posts/#{@post.id}"
        replies = Reply.where(post_id: @post.id)
        assert_equal 0, replies.size
    end

    test "post with replies" do
        get "/posts/#{@post.id}"
        # puts Reply.all.count
        # assert_equal 0, Reply.where(post_id: @post.id).size
        fill_in "Content", with: "This is a reply!"
        click_on "Send"
        # puts Reply.all.count

        # assert_equal 1, Reply.where(post_id: @post.id).size
        assert_response :redirect
    end
end