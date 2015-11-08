require 'test_helper'

class AdoptionResponsesControllerTest < ActionController::TestCase
  setup do
    @adoption_response = adoption_responses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:adoption_responses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create adoption_response" do
    assert_difference('AdoptionResponse.count') do
      post :create, adoption_response: { adoption_request_id: @adoption_response.adoption_request_id, owner_id: @adoption_response.owner_id }
    end

    assert_redirected_to adoption_response_path(assigns(:adoption_response))
  end

  test "should show adoption_response" do
    get :show, id: @adoption_response
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @adoption_response
    assert_response :success
  end

  test "should update adoption_response" do
    patch :update, id: @adoption_response, adoption_response: { adoption_request_id: @adoption_response.adoption_request_id, owner_id: @adoption_response.owner_id }
    assert_redirected_to adoption_response_path(assigns(:adoption_response))
  end

  test "should destroy adoption_response" do
    assert_difference('AdoptionResponse.count', -1) do
      delete :destroy, id: @adoption_response
    end

    assert_redirected_to adoption_responses_path
  end
end
