require 'test_helper'

class Members::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get members_orders_new_url
    assert_response :success
  end

  test "should get show" do
    get members_orders_show_url
    assert_response :success
  end

  test "should get thanks" do
    get members_orders_thanks_url
    assert_response :success
  end

end
