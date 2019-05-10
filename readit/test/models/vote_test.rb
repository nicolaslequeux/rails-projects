require 'test_helper'

class VoteTest < ActiveSupport::TestCase

  test "votes have a story" do
    assert_equal stories(:one), votes(:one).story
  end

  test "vote is associated with a user" do
    assert_equal users(:john), votes(:two).user
  end

end
