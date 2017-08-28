require 'test_helper'

class StaticHomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get static_home_index_url
    assert_response :success
  end

end
