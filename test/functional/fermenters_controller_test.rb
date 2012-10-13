require 'test_helper'

class FermentersControllerTest < ActionController::TestCase
  setup do
    @fermenter = fermenters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fermenters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fermenter" do
    assert_difference('Fermenter.count') do
      post :create, fermenter: { fermenter_type: @fermenter.fermenter_type, name: @fermenter.name, size: @fermenter.size }
    end

    assert_redirected_to fermenter_path(assigns(:fermenter))
  end

  test "should show fermenter" do
    get :show, id: @fermenter
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fermenter
    assert_response :success
  end

  test "should update fermenter" do
    put :update, id: @fermenter, fermenter: { fermenter_type: @fermenter.fermenter_type, name: @fermenter.name, size: @fermenter.size }
    assert_redirected_to fermenter_path(assigns(:fermenter))
  end

  test "should destroy fermenter" do
    assert_difference('Fermenter.count', -1) do
      delete :destroy, id: @fermenter
    end

    assert_redirected_to fermenters_path
  end
end
