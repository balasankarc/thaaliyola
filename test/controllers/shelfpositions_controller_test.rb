require 'test_helper'

class ShelfpositionsControllerTest < ActionController::TestCase
  setup do
    @shelfposition = shelfpositions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shelfpositions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shelfposition" do
    assert_difference('Shelfposition.count') do
      post :create, shelfposition: { book_id: @shelfposition.book_id, shelf_id: @shelfposition.shelf_id }
    end

    assert_redirected_to shelfposition_path(assigns(:shelfposition))
  end

  test "should show shelfposition" do
    get :show, id: @shelfposition
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shelfposition
    assert_response :success
  end

  test "should update shelfposition" do
    patch :update, id: @shelfposition, shelfposition: { book_id: @shelfposition.book_id, shelf_id: @shelfposition.shelf_id }
    assert_redirected_to shelfposition_path(assigns(:shelfposition))
  end

  test "should destroy shelfposition" do
    assert_difference('Shelfposition.count', -1) do
      delete :destroy, id: @shelfposition
    end

    assert_redirected_to shelfpositions_path
  end
end
