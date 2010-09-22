require 'test_helper'

class CriticasControllerTest < ActionController::TestCase
  setup do
    @critica = criticas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:criticas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create critica" do
    assert_difference('Critica.count') do
      post :create, :critica => @critica.attributes
    end

    assert_redirected_to critica_path(assigns(:critica))
  end

  test "should show critica" do
    get :show, :id => @critica.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @critica.to_param
    assert_response :success
  end

  test "should update critica" do
    put :update, :id => @critica.to_param, :critica => @critica.attributes
    assert_redirected_to critica_path(assigns(:critica))
  end

  test "should destroy critica" do
    assert_difference('Critica.count', -1) do
      delete :destroy, :id => @critica.to_param
    end

    assert_redirected_to criticas_path
  end
end
