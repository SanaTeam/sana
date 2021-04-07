require "test_helper"

class MessageTest < ActiveSupport::TestCase
  test 'invalid without content' do
    refute messages(:without_content).valid?
  end

  test 'valid' do
    assert messages(:valid).valid?
  end
end
