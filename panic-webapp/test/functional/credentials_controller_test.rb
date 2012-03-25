require 'test_helper'

class CredentialsControllerTest < ActionController::TestCase
  setup do
    @credential = credentials(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:credentials)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create credential" do
    assert_difference('Credential.count') do
      post :create, credential: @credential.attributes
    end

    assert_redirected_to credential_path(assigns(:credential))
  end

  test "should show credential" do
    get :show, id: @credential.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @credential.to_param
    assert_response :success
  end

  test "should update credential" do
    put :update, id: @credential.to_param, credential: @credential.attributes
    assert_redirected_to credential_path(assigns(:credential))
  end

  test "should destroy credential" do
    assert_difference('Credential.count', -1) do
      delete :destroy, id: @credential.to_param
    end

    assert_redirected_to credentials_path
  end
end
