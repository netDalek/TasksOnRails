require "minitest_helper"

class UsersControllerTest < MiniTest::Rails::ActionController::TestCase

  before do
    @user = users(:one)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference('User.count') do
      post :create, user: { name: "sam", email: "sam@a.ru", password: "1", password_confirmation: "1" }
    end

    assert_redirected_to root_path
  end

  def test_edit
    get :edit, { id: @user }, {user_id: @user.id}
    assert_response :success
  end

  def test_update
    get :update, { id: @user }, {user_id: @user.id}
    assert_redirected_to root_path
  end
end
