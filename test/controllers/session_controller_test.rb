require "minitest_helper"

class SessionsControllerTest < MiniTest::Rails::ActionController::TestCase

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    post :create
    assert_response :success
  end

  def test_destroy
    delete :destroy
    assert_redirected_to root_path
  end

end
