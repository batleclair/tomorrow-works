require "test_helper"

class CvsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get cvs_new_url
    assert_response :success
  end
end
