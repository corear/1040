require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get lessons" do
    get :lessons
    assert_response :success
  end

  test "should get admin" do
    get :admin
    assert_response :success
  end

end
