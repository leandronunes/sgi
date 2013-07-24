require 'test_helper'

class AppropriationsControllerTest < ActionController::TestCase
  setup do
    @appropriation = appropriations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:appropriations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create appropriation" do
    assert_difference('Appropriation.count') do
      post :create, :appropriation => @appropriation.attributes
    end

    assert_redirected_to appropriation_path(assigns(:appropriation))
  end

  test "should show appropriation" do
    get :show, :id => @appropriation.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @appropriation.to_param
    assert_response :success
  end

  test "should update appropriation" do
    put :update, :id => @appropriation.to_param, :appropriation => @appropriation.attributes
    assert_redirected_to appropriation_path(assigns(:appropriation))
  end

  test "should destroy appropriation" do
    assert_difference('Appropriation.count', -1) do
      delete :destroy, :id => @appropriation.to_param
    end

    assert_redirected_to appropriations_path
  end
end
