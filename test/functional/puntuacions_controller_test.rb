require 'test_helper'

class PuntuacionsControllerTest < ActionController::TestCase
  setup do
    @puntuacion = puntuacions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:puntuacions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create puntuacion" do
    assert_difference('Puntuacion.count') do
      post :create, :puntuacion => @puntuacion.attributes
    end

    assert_redirected_to puntuacion_path(assigns(:puntuacion))
  end

  test "should show puntuacion" do
    get :show, :id => @puntuacion.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @puntuacion.to_param
    assert_response :success
  end

  test "should update puntuacion" do
    put :update, :id => @puntuacion.to_param, :puntuacion => @puntuacion.attributes
    assert_redirected_to puntuacion_path(assigns(:puntuacion))
  end

  test "should destroy puntuacion" do
    assert_difference('Puntuacion.count', -1) do
      delete :destroy, :id => @puntuacion.to_param
    end

    assert_redirected_to puntuacions_path
  end
end
