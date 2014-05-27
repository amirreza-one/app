require 'test_helper'

class LikablesControllerTest < ActionController::TestCase
  setup do
    @likable = likables(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:likables)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create likable" do
    assert_difference('Likable.count') do
      post :create, likable: { photo_event_id: @likable.photo_event_id, user_id: @likable.user_id }
    end

    assert_redirected_to likable_path(assigns(:likable))
  end

  test "should show likable" do
    get :show, id: @likable
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @likable
    assert_response :success
  end

  test "should update likable" do
    patch :update, id: @likable, likable: { photo_event_id: @likable.photo_event_id, user_id: @likable.user_id }
    assert_redirected_to likable_path(assigns(:likable))
  end

  test "should destroy likable" do
    assert_difference('Likable.count', -1) do
      delete :destroy, id: @likable
    end

    assert_redirected_to likables_path
  end
end
