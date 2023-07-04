require "test_helper"

class IndexControllerTest < ActionDispatch::IntegrationTest
  test "should get report_by_category" do
    get index_report_by_category_url
    assert_response :success
  end

  test "should get report_by_dates" do
    get index_report_by_dates_url
    assert_response :success
  end
end
