require 'test_helper'

class EspecialsControllerTest < ActionController::TestCase
  setup do
    @especial = especials(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:especials)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create especial" do
    assert_difference('Especial.count') do
      post :create, :especial => @especial.attributes
    end

    assert_redirected_to especial_path(assigns(:especial))
  end

  test "should show especial" do
    get :show, :id => @especial.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @especial.to_param
    assert_response :success
  end

  test "should update especial" do
    put :update, :id => @especial.to_param, :especial => @especial.attributes
    assert_redirected_to especial_path(assigns(:especial))
  end

  test "should destroy especial" do
    assert_difference('Especial.count', -1) do
      delete :destroy, :id => @especial.to_param
    end

    assert_redirected_to especials_path
  end
end
