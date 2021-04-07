require "test_helper"

class MatchTest < ActiveSupport::TestCase
  test 'without user id' do
    refute matches(:without_user_id).valid?
  end

  test 'valid' do
    assert matches(:valid).valid?
  end
end
