require 'test_helper'

class HopContractsControllerTest < ActionController::TestCase
  setup do
    @hop_contract = hop_contracts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hop_contracts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hop_contract" do
    assert_difference('HopContract.count') do
      post :create, hop_contract: { contract_amount: @hop_contract.contract_amount, used_amount: @hop_contract.used_amount, year: @hop_contract.year }
    end

    assert_redirected_to hop_contract_path(assigns(:hop_contract))
  end

  test "should show hop_contract" do
    get :show, id: @hop_contract
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hop_contract
    assert_response :success
  end

  test "should update hop_contract" do
    put :update, id: @hop_contract, hop_contract: { contract_amount: @hop_contract.contract_amount, used_amount: @hop_contract.used_amount, year: @hop_contract.year }
    assert_redirected_to hop_contract_path(assigns(:hop_contract))
  end

  test "should destroy hop_contract" do
    assert_difference('HopContract.count', -1) do
      delete :destroy, id: @hop_contract
    end

    assert_redirected_to hop_contracts_path
  end
end
