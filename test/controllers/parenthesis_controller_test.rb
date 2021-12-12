require "test_helper"

class ParenthesisControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get parenthesis_index_url
    assert_response :success
  end
end
