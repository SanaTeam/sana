require "test_helper"

class UserTest < ActiveSupport::TestCase

  test 'invalid without email' do
    refute users(:without_email).valid?
  end

  test 'invalid duplicate email' do
    refute users(:duplicate_email).valid?
  end

  test 'invalid short password' do
    refute users(:short_password).valid?
  end
end
