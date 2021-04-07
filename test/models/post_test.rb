require "test_helper"

class PostTest < ActiveSupport::TestCase
  test 'invalid without content' do
    refute posts(:without_content).valid?
  end

  test 'valid' do
    assert posts(:valid).valid?
  end
end
