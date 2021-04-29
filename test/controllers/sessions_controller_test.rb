require "test_helper"
require_relative '../helpers/NewSessionHelper.rb'
require_relative '../helpers/NewUserHelper.rb'


class SessionsControllerTest < ActionDispatch::IntegrationTest
    include NewSessionHelper
    include NewUserHelper

    setup do
        # creates new user, so we can pass that info to login
        @user_info = new_user()
        @user_email = @user_info[0]
        @user_password = @user_info[1]        
        @user = User.find_by(email: @user_info[0])
        delete session_path(session)
    end

    test "not logged in" do
        get root_path
        assert_response :success
        get posts_path
        assert_redirected_to controller: "sessions", action: "new"
        get matches_path
        assert_redirected_to controller: "sessions", action: "new"
        get user_path(users(:valid_user).id)
        assert_redirected_to controller: "sessions", action: "new"
    end

    test "logged in" do
        new_session(@user_email, @user_password)
        assert_response :redirect
        assert_redirected_to user_path(@user)
    end
end
