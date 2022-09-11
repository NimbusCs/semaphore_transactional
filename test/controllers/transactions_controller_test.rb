require 'test_helper'

class TransactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @transaction = transactions(:one)
  end

  test "should get index" do
    get transactions_url, as: :json
    assert_response :success
  end

  test "should create transaction" do
    assert_difference('Transaction.count') do
      post transactions_url, params: { transaction: { amount: @transaction.amount, concept: @transaction.concept, meta_data: @transaction.meta_data, receiver_code: @transaction.receiver_code, sender_code: @transaction.sender_code, status: @transaction.status } }, as: :json
    end

    assert_response 201
  end

  test "should show transaction" do
    get transaction_url(@transaction), as: :json
    assert_response :success
  end

  test "should update transaction" do
    patch transaction_url(@transaction), params: { transaction: { amount: @transaction.amount, concept: @transaction.concept, meta_data: @transaction.meta_data, receiver_code: @transaction.receiver_code, sender_code: @transaction.sender_code, status: @transaction.status } }, as: :json
    assert_response 200
  end

  test "should destroy transaction" do
    assert_difference('Transaction.count', -1) do
      delete transaction_url(@transaction), as: :json
    end

    assert_response 204
  end
end
