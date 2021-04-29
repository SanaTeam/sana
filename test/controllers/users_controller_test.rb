require "test_helper"
require_relative '../../app/helpers/sessions_helper'
require_relative '../helpers/NewUserHelper.rb'

class UsersControllerTest < ActionDispatch::IntegrationTest
    include NewUserHelper

    test "sign up" do
        new_user()
        assert_response :redirect
        assert flash[:notice], "Your account was created!"
    end

    test "should get index" do
        get users_path
        assert_response :success
    end
        
    # test "should get index" do
    #     get "index"
    #     assert response :success
    # end
    
    # test "should get show" do
    #     get "show"
    #     assert response :success
    # end

    # test "should get new" do
    #     get "new"
    #     assert response :success
    # end
end
