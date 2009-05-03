require 'test_helper'

class FileclipsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fileclips)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fileclip" do
    assert_difference('Fileclip.count') do
      post :create, :fileclip => { }
    end

    assert_redirected_to fileclip_path(assigns(:fileclip))
  end

  test "should show fileclip" do
    get :show, :id => fileclips(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => fileclips(:one).to_param
    assert_response :success
  end

  test "should update fileclip" do
    put :update, :id => fileclips(:one).to_param, :fileclip => { }
    assert_redirected_to fileclip_path(assigns(:fileclip))
  end

  test "should destroy fileclip" do
    assert_difference('Fileclip.count', -1) do
      delete :destroy, :id => fileclips(:one).to_param
    end

    assert_redirected_to fileclips_path
  end
end
