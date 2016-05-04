require 'test_helper'

class LogsControllerTest < ActionController::TestCase
  setup do
    @log = logs(:one)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should show log" do
    get :show, id: @log
    assert_response :success
  end
  
end
