require "test_helper"
require_relative '../helpers/NewUserHelper.rb'
require_relative '../helpers/NewOrganizationHelper.rb'
require_relative '../helpers/NewPostHelper.rb'

Minitest::Reporters.use!

class MatchesControllerTest < ActionDispatch::IntegrationTest
    include NewUserHelper
    include NewOrganizationHelper
    include NewPostHelper
    
end
