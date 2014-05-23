require 'test_helper'

class IssuingsControllerTest < ActionController::TestCase
  setup do
    @issuing = issuings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:issuings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create issuing" do
    assert_difference('Issuing.count') do
      post :create, issuing: { book_id: @issuing.book_id, user_id: @issuing.user_id }
    end

    assert_redirected_to issuing_path(assigns(:issuing))
  end

  test "should show issuing" do
    get :show, id: @issuing
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @issuing
    assert_response :success
  end

  test "should update issuing" do
    patch :update, id: @issuing, issuing: { book_id: @issuing.book_id, user_id: @issuing.user_id }
    assert_redirected_to issuing_path(assigns(:issuing))
  end

  test "should destroy issuing" do
    assert_difference('Issuing.count', -1) do
      delete :destroy, id: @issuing
    end

    assert_redirected_to issuings_path
  end
end
