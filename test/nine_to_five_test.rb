require "test_helper"

class NineToFiveTest < ActionDispatch::IntegrationTest
  test "before working hours" do
    travel_to Time.current.change(hour: NineToFive.start_hour - 1) do
      get '/'
      assert_response 200
      assert_equal 'Please come back later', response.body
    end
  end

  test "during working hours" do
    travel_to Time.current.change(hour: NineToFive.start_hour) do
      get '/'
      assert_response 200
      assert_equal 'Home Page', response.body
    end
  end

  test "after working hours" do
    travel_to Time.current.change(hour: NineToFive.end_hour + 1) do
      get '/'
      assert_response 200
      assert_equal 'Please come back later', response.body
    end
  end
end
