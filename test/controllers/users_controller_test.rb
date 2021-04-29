require "test_helper"
require_relative '../../app/helpers/sessions_helper'
require_relative '../helpers/NewUserHelper.rb'

class UsersControllerTest < ActionDispatch::IntegrationTest
    include NewUserHelper

    setup do
        @user_info = new_user()
        @user_email = @user_info[0]
        @user_password = @user_info[1]
        @user_id = User.find_by(email: @user_info[0]).id
    end

    test "sign up" do
        delete session_path(session)
        new_user()
        assert_response :redirect
        assert flash[:notice], "Your account was created!"
    end
        
    test "should get index" do
        get users_path
        assert_response :success
        assert_template "index"
    end
    
    test "should get show" do
        get user_path(@user_id)
        assert_response :success
        assert_template "show"
    end

    test "should get new" do
        get new_user_path
        assert_response :success
        assert_template "new"
    end
end
