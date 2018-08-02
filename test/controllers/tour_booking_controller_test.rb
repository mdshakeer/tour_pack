require 'test_helper'

class TourBookingControllerTest < ActionDispatch::IntegrationTest
  test "should get tour_booker" do
    get tour_booking_tour_booker_url
    assert_response :success
  end

  test "should get tour_confirm" do
    get tour_booking_tour_confirm_url
    assert_response :success
  end

end
