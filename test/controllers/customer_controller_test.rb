require 'test_helper'

class CustomerControllerTest < ActionController::TestCase

  test "should get index for all" do
    get :index, :format => :json
    assert_response :success
  end

  test "should get show by id" do
    get :show, :format => :json, :id => 1
    assert_response :success
  end

  test "should post create" do
    post :create
    assert_response :success
  end

  test "should post update" do
    post :update, :format => :json, :id => 1
    assert_response :success
  end

  test "should get delete" do
    get :delete, :format => :json, :id => 1
    assert_response :success
  end

end
