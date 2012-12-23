require "minitest_helper"

class StoriesControllerTest < MiniTest::Rails::ActionController::TestCase

  before do
    @story = stories(:one)
    session[:user_id] = users(:one).id
  end

  def test_index
    get :index, nil
    assert_response :success
    assert_not_nil assigns(:stories)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference('Story.count') do
      post :create, story: { title: "title" }
    end

    assert_redirected_to stories_path
  end

  def test_show
    get :show, id: @story
    assert_response :success
  end

  def test_edit
    get :edit, id: @story
    assert_response :success
  end

  def test_update
    put :update, id: @story, story: { title: "newtitle" }
    assert_redirected_to story_path(assigns(:story))
  end

  def test_destroy
    assert_difference('Story.count', -1) do
      delete :destroy, id: @story
    end

    assert_redirected_to stories_path
  end

  def test_change_state
    put :change_state, id: @story, event: "start"
    assert_response :success
    assert_equal "started", Story.find(@story).state
  end
end
