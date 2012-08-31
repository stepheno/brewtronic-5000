require 'test_helper'

class HopSuppliersControllerTest < ActionController::TestCase
  setup do
    @hop_supplier = hop_suppliers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hop_suppliers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hop_supplier" do
    assert_difference('HopSupplier.count') do
      post :create, hop_supplier: { name: @hop_supplier.name }
    end

    assert_redirected_to hop_supplier_path(assigns(:hop_supplier))
  end

  test "should show hop_supplier" do
    get :show, id: @hop_supplier
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hop_supplier
    assert_response :success
  end

  test "should update hop_supplier" do
    put :update, id: @hop_supplier, hop_supplier: { name: @hop_supplier.name }
    assert_redirected_to hop_supplier_path(assigns(:hop_supplier))
  end

  test "should destroy hop_supplier" do
    assert_difference('HopSupplier.count', -1) do
      delete :destroy, id: @hop_supplier
    end

    assert_redirected_to hop_suppliers_path
  end
end
