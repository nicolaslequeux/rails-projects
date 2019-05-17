require 'test_helper'

class StoriesControllerTest < ActionDispatch::IntegrationTest

  test "should get index" do
    get stories_url
    assert_response :success
  end

  test "should get new" do
    login_user
    get new_story_path
    assert_response :success
    assert_template "new"
    assert_not_nil assigns(:story)
  end

  test "new shows new form" do
    login_user
    get new_story_path
    assert_select 'form div', count: 3
  end

  test "adds a story" do
    login_user
    assert_difference "Story.count" do
      post stories_path, params: {
        story: {
          name: 'test story',
          link: 'http://www.test.com'
        }
      }
    end
    assert_redirected_to stories_path
    assert_not_nil flash[:notice]
  end

  test "rejects when missing story attribute" do
    login_user
    assert_no_difference 'Story.count' do
      post stories_path, params: {
      story: { name: 'story without a link'}
      }
    end
  end

  test "show story submitter" do
    get story_path(stories(:one))
    assert_select 'p.submitted_by span', 'Glenn Goodrich'
  end

  test "indicates not logged in" do
    get stories_path
    assert_select 'div#login_logout em', 'Not logged in.'
  end

  test "show navigation menu" do
    get stories_path
    assert_select 'ul#navigation li', 3
  end

  test "increments vote counter cache" do
    stories(:two).votes.create(user: users(:glenn))
    stories(:two).reload
    assert_equal 1, stories(:two).attributes['votes_count']
  end

  test "decrements votes counter cache" do
    stories(:one).votes.first.destroy
    stories(:one).reload
    assert_equal 1, stories(:one).attributes['votes_count']
  end


end
