require "test_helper"
require_relative '../helpers/NewUserHelper.rb'
require_relative '../helpers/NewOrganizationHelper.rb'
require_relative '../helpers/NewPostHelper.rb'
require_relative '../helpers/NewMatchHelper.rb'

Minitest::Reporters.use!

class MatchesControllerTest < ActionDispatch::IntegrationTest
    include NewUserHelper
    include NewOrganizationHelper
    include NewPostHelper
    include NewMatchHelper

    setup do
        @user1_info = new_user()
        @user1_email = @user1_info[0]
        @user1_id = User.find_by(email: @user1_info[0]).id
        delete session_path(session)
        @user2_info = new_user()
        @user2_email = @user2_info[0]
        @user2_id = User.find_by(email: @user2_info[0]).id
        post_title = "Post #1"
        new_post(post_title, nil)
        @post = Post.find_by(title: post_title)
    end

    test "user with no matches" do
        matches = Match.where(user1_id: @user2_id).or(Match.where(user2_id: @user2_id))
        assert_equal 0, matches.size
    end

    test "user with matches" do
        assert_equal 0, Match.where(user1_id: @user2_id).or(Match.where(user2_id: @user2_id)).size
        new_match(@post.id, @user1_id, @user2_id)
        assert flash[:alert], "Your match hasn't yet been confirmed!"

        

        # assert_response :success
        # assert_equal 1, Match.where(user1_id: @user2_id).or(Match.where(user2_id: @user2_id)).size
    end


end
