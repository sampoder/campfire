require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get sessions_create_url
    assert_response :success
  end

  test "should get authenticate" do
    get sessions_authenticate_url
    assert_response :success
  end
end
