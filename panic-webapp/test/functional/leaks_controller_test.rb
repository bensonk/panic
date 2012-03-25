require 'test_helper'

class LeaksControllerTest < ActionController::TestCase
  setup do
    @leak = leaks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:leaks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create leak" do
    assert_difference('Leak.count') do
      post :create, leak: @leak.attributes
    end

    assert_redirected_to leak_path(assigns(:leak))
  end

  test "should show leak" do
    get :show, id: @leak.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @leak.to_param
    assert_response :success
  end

  test "should update leak" do
    put :update, id: @leak.to_param, leak: @leak.attributes
    assert_redirected_to leak_path(assigns(:leak))
  end

  test "should destroy leak" do
    assert_difference('Leak.count', -1) do
      delete :destroy, id: @leak.to_param
    end

    assert_redirected_to leaks_path
  end
end
