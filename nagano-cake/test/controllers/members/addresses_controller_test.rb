require 'test_helper'

class Members::AddressesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get members_addresses_index_url
    assert_response :success
  end

  test "should get create" do
    get members_addresses_create_url
    assert_response :success
  end

  test "should get edit" do
    get members_addresses_edit_url
    assert_response :success
  end

  test "should get update" do
    get members_addresses_update_url
    assert_response :success
  end

  test "should get destroy" do
    get members_addresses_destroy_url
    assert_response :success
  end

end
