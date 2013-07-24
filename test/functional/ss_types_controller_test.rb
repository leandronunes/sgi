require 'test_helper'

class SsTypesControllerTest < ActionController::TestCase
  setup do
    @ss_type = ss_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ss_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ss_type" do
    assert_difference('SsType.count') do
      post :create, :ss_type => @ss_type.attributes
    end

    assert_redirected_to ss_type_path(assigns(:ss_type))
  end

  test "should show ss_type" do
    get :show, :id => @ss_type.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @ss_type.to_param
    assert_response :success
  end

  test "should update ss_type" do
    put :update, :id => @ss_type.to_param, :ss_type => @ss_type.attributes
    assert_redirected_to ss_type_path(assigns(:ss_type))
  end

  test "should destroy ss_type" do
    assert_difference('SsType.count', -1) do
      delete :destroy, :id => @ss_type.to_param
    end

    assert_redirected_to ss_types_path
  end
end
