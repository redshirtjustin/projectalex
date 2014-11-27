require 'test_helper'

class StoriesControllerTest < ActionController::TestCase
  setup do
    @story = stories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create story" do
    assert_difference('Story.count') do
      post :create, story: { headline: @story.headline, leadline: @story.leadline, mast_url: @story.mast_url, pipeline_id: @story.pipeline_id, priority_id: @story.priority_id, section_id: @story.section_id, shortline: @story.shortline, thumb_url: @story.thumb_url }
    end

    assert_redirected_to story_path(assigns(:story))
  end

  test "should show story" do
    get :show, id: @story
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @story
    assert_response :success
  end

  test "should update story" do
    patch :update, id: @story, story: { headline: @story.headline, leadline: @story.leadline, mast_url: @story.mast_url, pipeline_id: @story.pipeline_id, priority_id: @story.priority_id, section_id: @story.section_id, shortline: @story.shortline, thumb_url: @story.thumb_url }
    assert_redirected_to story_path(assigns(:story))
  end

  test "should destroy story" do
    assert_difference('Story.count', -1) do
      delete :destroy, id: @story
    end

    assert_redirected_to stories_path
  end
end
