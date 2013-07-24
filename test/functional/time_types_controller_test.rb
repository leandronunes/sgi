require 'test_helper'

class TimeTypesControllerTest < ActionController::TestCase
  setup do
    @time_type = time_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:time_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create time_type" do
    assert_difference('TimeType.count') do
      post :create, :time_type => @time_type.attributes
    end

    assert_redirected_to time_type_path(assigns(:time_type))
  end

  test "should show time_type" do
    get :show, :id => @time_type.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @time_type.to_param
    assert_response :success
  end

  test "should update time_type" do
    put :update, :id => @time_type.to_param, :time_type => @time_type.attributes
    assert_redirected_to time_type_path(assigns(:time_type))
  end

  test "should destroy time_type" do
    assert_difference('TimeType.count', -1) do
      delete :destroy, :id => @time_type.to_param
    end

    assert_redirected_to time_types_path
  end
end
