require 'test_helper'

class StoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get stories_url
    assert_response :success
  end

  # test "should get new" do
  #   get :new
  #   assert_response :success
  #   assert_template 'new'
  #   assert_not_nil assigns(:story)
  # end

  test "new shows new form" do
    get new_story_path
    assert_select 'form div', count: 2
  end

  test "add a story" do
    assert_difference "Story.count" do
      post stories_path, params: {
        story: {
          name: 'test story',
          link: 'http://www.test.com/'
        }
      }
      assert_redirected_to stories_path
      assert_not_nil flash[:notice]
    end
  end

  test "rejects when missing story attribute" do
    assert_no_difference "Story.count" do
      post stories_path, params: {
        story: { name: 'story without a link' }
      }
    end
  end

  test "show story" do
    get story_path(stories(:one))
    assert_response :success
    assert response.body.include?(stories(:one).name)
  end

  test "show story vote elements" do
    get story_path(stories(:one))
    assert_select 'h2 span#vote_score'
    assert_select 'ul#vote_history li', count: 2
    assert_select 'div#vote_form form'
  end

end
