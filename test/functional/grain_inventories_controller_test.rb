require 'test_helper'

class GrainInventoriesControllerTest < ActionController::TestCase
  setup do
    @grain_inventory = grain_inventories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:grain_inventories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create grain_inventory" do
    assert_difference('GrainInventory.count') do
      post :create, grain_inventory: { amount: @grain_inventory.amount }
    end

    assert_redirected_to grain_inventory_path(assigns(:grain_inventory))
  end

  test "should show grain_inventory" do
    get :show, id: @grain_inventory
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @grain_inventory
    assert_response :success
  end

  test "should update grain_inventory" do
    put :update, id: @grain_inventory, grain_inventory: { amount: @grain_inventory.amount }
    assert_redirected_to grain_inventory_path(assigns(:grain_inventory))
  end

  test "should destroy grain_inventory" do
    assert_difference('GrainInventory.count', -1) do
      delete :destroy, id: @grain_inventory
    end

    assert_redirected_to grain_inventories_path
  end
end
