require 'test_helper'

class HopInventoriesControllerTest < ActionController::TestCase
  setup do
    @hop_inventory = hop_inventories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hop_inventories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hop_inventory" do
    assert_difference('HopInventory.count') do
      post :create, hop_inventory: { amount: @hop_inventory.amount, crop_year: @hop_inventory.crop_year, type: @hop_inventory.type }
    end

    assert_redirected_to hop_inventory_path(assigns(:hop_inventory))
  end

  test "should show hop_inventory" do
    get :show, id: @hop_inventory
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hop_inventory
    assert_response :success
  end

  test "should update hop_inventory" do
    put :update, id: @hop_inventory, hop_inventory: { amount: @hop_inventory.amount, crop_year: @hop_inventory.crop_year, type: @hop_inventory.type }
    assert_redirected_to hop_inventory_path(assigns(:hop_inventory))
  end

  test "should destroy hop_inventory" do
    assert_difference('HopInventory.count', -1) do
      delete :destroy, id: @hop_inventory
    end

    assert_redirected_to hop_inventories_path
  end
end
