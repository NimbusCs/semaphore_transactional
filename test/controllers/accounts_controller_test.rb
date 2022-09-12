require 'test_helper'
include AuthorizationHelper
class AccountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    test_user = { email: 'user@test.com', password: 'testuser' }
    sign_up(test_user)
    @auth_tokens = auth_tokens_for_user(test_user)
    @account = accounts(:one)
  end

  test "should get index" do
    get accounts_url, headers: @auth_tokens, as: :json
    assert_response :success
  end

  test "should create account" do
    assert_difference('Account.count') do
      post accounts_url, params: { account: { enabled: @account.enabled, meta_data: @account.meta_data, name: @account.name, type_a: @account.type_a } }, headers: @auth_tokens, as: :json
    end

    assert_response 201
  end

  test "should show account" do
    get account_url(@account.code), headers: @auth_tokens, as: :json
    assert_response :success
  end

  

  test "should destroy account" do
    assert_difference('Account.count', -1) do
      delete account_url(@account.code), headers: @auth_tokens, as: :json
    end

    assert_response 204
  end
end
