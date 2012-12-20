require 'test_helper'

class HopTransactionsControllerTest < ActionController::TestCase
  setup do
    @hop_transaction = hop_transactions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hop_transactions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hop_transaction" do
    assert_difference('HopTransaction.count') do
      post :create, hop_transaction: { hop_id: 1, hop_supplier_id:1, hop_year:2012, quantity: @hop_transaction.quantity, amount: @hop_transaction.amount, unit: 'kg' }
    end

    assert_redirected_to hop_transaction_path
  end

  test "should show hop_transaction" do
    get :show, id: @hop_transaction
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hop_transaction
    assert_response :success
  end

  test "should update hop_transaction" do
    put :update, id: @hop_transaction, hop_transaction: { hop_id: 1, hop_supplier_id:1, hop_year:2012, quantity: @hop_transaction.quantity, amount: @hop_transaction.amount, unit: 'kg' }
    assert_redirected_to hop_transaction_path
  end

  test "should destroy hop_transaction" do
    assert_difference('HopTransaction.count', -1) do
      delete :destroy, id: @hop_transaction
    end

    assert_redirected_to hop_transactions_path
  end
end
