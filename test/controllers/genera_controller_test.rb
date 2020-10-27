require 'test_helper'

class GeneraControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get genera_index_url
    assert_response :success
  end

  test "should get show" do
    get genera_show_url
    assert_response :success
  end

end
