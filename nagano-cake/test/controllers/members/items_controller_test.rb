require 'test_helper'

class Members::ItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get members_items_index_url
    assert_response :success
  end

  test "should get show" do
    get members_items_show_url
    assert_response :success
  end

end
