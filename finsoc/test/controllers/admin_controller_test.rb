require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  test "should get events" do
    get :events
    assert_response :success
  end

  test "should get sponsors" do
    get :sponsors
    assert_response :success
  end

end
