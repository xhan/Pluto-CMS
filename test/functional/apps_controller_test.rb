require 'test_helper'

class AppsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:apps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create apps" do
    assert_difference('Apps.count') do
      post :create, :apps => { }
    end

    assert_redirected_to apps_path(assigns(:apps))
  end

  test "should show apps" do
    get :show, :id => apps(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => apps(:one).to_param
    assert_response :success
  end

  test "should update apps" do
    put :update, :id => apps(:one).to_param, :apps => { }
    assert_redirected_to apps_path(assigns(:apps))
  end

  test "should destroy apps" do
    assert_difference('Apps.count', -1) do
      delete :destroy, :id => apps(:one).to_param
    end

    assert_redirected_to apps_path
  end
end
