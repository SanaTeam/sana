ENV['RAILS_ENV'] ||= 'test'
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # reindex models for searchkick 
  Post.reindex

  # and disable callbacks
  Searchkick.disable_callbacks

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  

  # Helps create a new session to be used for routes that are regulated by authentication

end
