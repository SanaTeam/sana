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

  test 'valid user' do
    assert users(:valid_user).valid?
    assert_instance_of User, users(:valid_user).authenticate("password")
  end
end
