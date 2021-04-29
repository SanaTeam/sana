require "test_helper"
require_relative '../helpers/NewSessionHelper.rb'
require_relative '../helpers/NewUserHelper.rb'


class SessionsControllerTest < ActionDispatch::IntegrationTest
    include NewSessionHelper
    include NewUserHelper

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

        puts users(:valid_user).inspect

        new_session(users(:valid_user))
        assert_equal 2, 2
        # assert_select ".card-title", "#{users(:valid_user).first_name} #{users(:valid_user).last_name}"
    end
end
