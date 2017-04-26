require 'test_helper'

class MainControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get events" do
    get :events
    assert_response :success
  end

  test "should get sponsorship" do
    get :sponsorship
    assert_response :success
  end

  test "should get about-us" do
    get :about-us
    assert_response :success
  end

  test "should get newsletter" do
    get :newsletter
    assert_response :success
  end

  test "should get contact-us" do
    get :contact-us
    assert_response :success
  end

  test "should get publications" do
    get :publications
    assert_response :success
  end

  test "should get course-guide" do
    get :course-guide
    assert_response :success
  end

end
