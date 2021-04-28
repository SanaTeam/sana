require "test_helper"
require_relative '../../app/helpers/sessions_helper'
require_relative '../helpers/NewSessionHelper.rb'

class UsersControllerTest < ActionDispatch::IntegrationTest
    include NewSessionHelper
    
    setup do
        new_session(users(:valid_user))
    end
        
    test "should get index" do
        get "index"
        assert response :success
    end
    
    test "should get show" do
        get "show"
        assert response :success
    end

    test "should get new" do
        get "new"
        assert response :success
    end
end
