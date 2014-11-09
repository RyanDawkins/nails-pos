require 'test_helper'

class ScheduleControllerTest < ActionController::TestCase

  test "create" do
    post :create
    assert_response :success
  end

  test "update" do
    post :update, :format => :json, :id => 1
    assert_response :success
  end

end
