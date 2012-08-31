require 'test_helper'

class HopsControllerTest < ActionController::TestCase
  setup do
    @hop = hops(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hops)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hop" do
    assert_difference('Hop.count') do
      post :create, hop: { alpha: @hop.alpha, name: @hop.name }
    end

    assert_redirected_to hop_path(assigns(:hop))
  end

  test "should show hop" do
    get :show, id: @hop
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hop
    assert_response :success
  end

  test "should update hop" do
    put :update, id: @hop, hop: { alpha: @hop.alpha, name: @hop.name }
    assert_redirected_to hop_path(assigns(:hop))
  end

  test "should destroy hop" do
    assert_difference('Hop.count', -1) do
      delete :destroy, id: @hop
    end

    assert_redirected_to hops_path
  end
end
