require 'test_helper'

class Admins::MembersControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get admins_members_update_url
    assert_response :success
  end

  test "should get edit" do
    get admins_members_edit_url
    assert_response :success
  end

  test "should get index" do
    get admins_members_index_url
    assert_response :success
  end

  test "should get show" do
    get admins_members_show_url
    assert_response :success
  end

end
