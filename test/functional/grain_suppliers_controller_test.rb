require 'test_helper'

class GrainSuppliersControllerTest < ActionController::TestCase
  setup do
    @grain_supplier = grain_suppliers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:grain_suppliers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create grain_supplier" do
    assert_difference('GrainSupplier.count') do
      post :create, grain_supplier: { name: @grain_supplier.name }
    end

    assert_redirected_to grain_supplier_path(assigns(:grain_supplier))
  end

  test "should show grain_supplier" do
    get :show, id: @grain_supplier
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @grain_supplier
    assert_response :success
  end

  test "should update grain_supplier" do
    put :update, id: @grain_supplier, grain_supplier: { name: @grain_supplier.name }
    assert_redirected_to grain_supplier_path(assigns(:grain_supplier))
  end

  test "should destroy grain_supplier" do
    assert_difference('GrainSupplier.count', -1) do
      delete :destroy, id: @grain_supplier
    end

    assert_redirected_to grain_suppliers_path
  end
end
