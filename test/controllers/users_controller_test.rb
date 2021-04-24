require "test_helper"
require_relative '../../app/helpers/sessions_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
    test "should get show" do
        get "index"
        assert response :success
    end
end
