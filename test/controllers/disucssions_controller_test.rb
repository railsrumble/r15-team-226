require 'test_helper'

class DisucssionsControllerTest < ActionController::TestCase
  setup do
    @disucssion = disucssions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:disucssions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create disucssion" do
    assert_difference('Disucssion.count') do
      post :create, disucssion: { breed: @disucssion.breed, content: @disucssion.content, topic: @disucssion.topic, type: @disucssion.type }
    end

    assert_redirected_to disucssion_path(assigns(:disucssion))
  end

  test "should show disucssion" do
    get :show, id: @disucssion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @disucssion
    assert_response :success
  end

  test "should update disucssion" do
    patch :update, id: @disucssion, disucssion: { breed: @disucssion.breed, content: @disucssion.content, topic: @disucssion.topic, type: @disucssion.type }
    assert_redirected_to disucssion_path(assigns(:disucssion))
  end

  test "should destroy disucssion" do
    assert_difference('Disucssion.count', -1) do
      delete :destroy, id: @disucssion
    end

    assert_redirected_to disucssions_path
  end
end
