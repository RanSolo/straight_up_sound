require 'test_helper'

class StaticPageControllerTest < ActionController::TestCase
  test "should get Home" do
    get :Home
    assert_response :success
  end

  test "should get Help" do
    get :Help
    assert_response :success
  end

end
