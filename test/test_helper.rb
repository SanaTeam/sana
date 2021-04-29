ENV['RAILS_ENV'] ||= 'test'
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # reindex models for searchkick 
  Post.reindex
  User.reindex

  # and disable callbacks
  Searchkick.disable_callbacks

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Helps create a new session to be used for routes that are regulated by authentication
  def help_new_session
    first = Faker::Name.first_name
    last = Faker::Name.last_name
    email = Faker::Internet.email(name: first)
    pass = Faker::Internet.password(min_length: 8, max_length: 14)
    post users_path, params: { 
      user: {
        first_name: first, 
        last_name: last, 
        email: email, 
        password: pass, 
        password_confirmation: pass,
        admin: true
      } }
      
    assert_response :redirect
    follow_redirect!
    assert_select ".card-title", "#{first} #{last}"
  end
end
