require 'test_helper'

class Members::CartsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get members_carts_index_url
    assert_response :success
  end

end
