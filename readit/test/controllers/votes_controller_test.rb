require 'test_helper'

class VotesControllerTest < ActionDispatch::IntegrationTest

# NLX : if you would like to run a block of code before the start of each test
#       and another block of code after the end of each test,
#       you have two special callbacks for your rescue (setup/teardown)

  def setup
    login_user
  end

  def teardown
    logout_user
  end


  test "creates vote" do
    # login_user
    assert_difference 'stories(:two).votes.count' do
      post story_votes_path(stories(:two))
    end
  end


end
