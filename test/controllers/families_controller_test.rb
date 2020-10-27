require 'test_helper'

class FamiliesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get families_index_url
    assert_response :success
  end

  test "should get show" do
    get families_show_url
    assert_response :success
  end

end
