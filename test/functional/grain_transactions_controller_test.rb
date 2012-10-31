require 'test_helper'

class GrainTransactionsControllerTest < ActionController::TestCase
  setup do
    @grain_transaction = grain_transactions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:grain_transactions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create grain_transaction" do
    assert_difference('GrainTransaction.count') do
      post :create, grain_transaction: { quantity: @grain_transaction.quantity, unit_amount: @grain_transaction.unit_amount }
    end

    assert_redirected_to grain_transaction_path(assigns(:grain_transaction))
  end

  test "should show grain_transaction" do
    get :show, id: @grain_transaction
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @grain_transaction
    assert_response :success
  end

  test "should update grain_transaction" do
    put :update, id: @grain_transaction, grain_transaction: { quantity: @grain_transaction.quantity, unit_amount: @grain_transaction.unit_amount }
    assert_redirected_to grain_transaction_path(assigns(:grain_transaction))
  end

  test "should destroy grain_transaction" do
    assert_difference('GrainTransaction.count', -1) do
      delete :destroy, id: @grain_transaction
    end

    assert_redirected_to grain_transactions_path
  end
end
