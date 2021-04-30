require "test_helper"
require "minitest/reporters"

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get root_path
    assert_response :success
    assert_template 'welcome/index'
  end
end
