require 'test_helper'

class ReportingControllerTest < ActionController::TestCase
  test "should get ttb" do
    get :ttb
    assert_response :success
  end

  test "should get grain" do
    get :grain
    assert_response :success
  end

  test "should get hop" do
    get :hop
    assert_response :success
  end

  test "should get fermenter" do
    get :fermenter
    assert_response :success
  end

end
