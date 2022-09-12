require 'test_helper'
include AuthorizationHelper
class TransactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    test_user = { email: 'user@test.com', password: 'testuser' }
    sign_up(test_user)
    @auth_tokens = auth_tokens_for_user(test_user)
    @transaction = transactions(:one)
  end

  test "should get index" do
    get transactions_url, headers: @auth_tokens, as: :json
    assert_response :success
  end
  
  test "should show transaction" do
    get transaction_url(@transaction.tx_id), headers: @auth_tokens, as: :json
    assert_response :success
  end

  test "should destroy transaction" do
    assert_difference('Transaction.count', -1) do
      delete transaction_url(@transaction.tx_id), headers: @auth_tokens, as: :json
    end

    assert_response 204
  end
end
