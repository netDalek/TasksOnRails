require "minitest_helper"

class CommentsControllerTest < MiniTest::Rails::ActionController::TestCase

  before do
    @story = stories(:one)
    session[:user_id] = 1
  end

  def test_create
    assert_difference('Comment.count') do
      post :create, { id: @story.id, comment: {text: "test"} }
    end
    assert_redirected_to story_path(1)
  end

end
