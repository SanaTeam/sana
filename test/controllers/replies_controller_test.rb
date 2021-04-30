require "test_helper"
require "minitest/reporters"
require_relative '../helpers/NewUserHelper.rb'
require_relative '../helpers/NewPostHelper.rb'

class RepliesControllerTest < ActionDispatch::IntegrationTest
    include NewUserHelper
    include NewPostHelper
    
    setup do
        post_title = Faker::GreekPhilosophers.name
        new_post(post_title, nil)
        @post = Post.find_by(title: post_title)
    end
  
    test "should get index" do
        get root_path
        assert_response :success
        assert_template 'welcome/index'
    end
end