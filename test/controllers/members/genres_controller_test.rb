require 'test_helper'

class Members::GenresControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get members_genres_show_url
    assert_response :success
  end

end
