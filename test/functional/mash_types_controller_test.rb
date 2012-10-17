require 'test_helper'

class MashTypesControllerTest < ActionController::TestCase
  setup do
    @mash_type = mash_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mash_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mash_type" do
    assert_difference('MashType.count') do
      post :create, mash_type: { name: @mash_type.name }
    end

    assert_redirected_to mash_type_path(assigns(:mash_type))
  end

  test "should show mash_type" do
    get :show, id: @mash_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mash_type
    assert_response :success
  end

  test "should update mash_type" do
    put :update, id: @mash_type, mash_type: { name: @mash_type.name }
    assert_redirected_to mash_type_path(assigns(:mash_type))
  end

  test "should destroy mash_type" do
    assert_difference('MashType.count', -1) do
      delete :destroy, id: @mash_type
    end

    assert_redirected_to mash_types_path
  end
end
