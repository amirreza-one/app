require 'test_helper'

class AmountTypesControllerTest < ActionController::TestCase
  setup do
    @amount_type = amount_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:amount_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create amount_type" do
    assert_difference('AmountType.count') do
      post :create, amount_type: { name: @amount_type.name }
    end

    assert_redirected_to amount_type_path(assigns(:amount_type))
  end

  test "should show amount_type" do
    get :show, id: @amount_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @amount_type
    assert_response :success
  end

  test "should update amount_type" do
    patch :update, id: @amount_type, amount_type: { name: @amount_type.name }
    assert_redirected_to amount_type_path(assigns(:amount_type))
  end

  test "should destroy amount_type" do
    assert_difference('AmountType.count', -1) do
      delete :destroy, id: @amount_type
    end

    assert_redirected_to amount_types_path
  end
end
