require 'test_helper'

class LanguagedivisionsControllerTest < ActionController::TestCase
  setup do
    @languagedivision = languagedivisions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:languagedivisions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create languagedivision" do
    assert_difference('Languagedivision.count') do
      post :create, languagedivision: { book_id: @languagedivision.book_id, language_id: @languagedivision.language_id }
    end

    assert_redirected_to languagedivision_path(assigns(:languagedivision))
  end

  test "should show languagedivision" do
    get :show, id: @languagedivision
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @languagedivision
    assert_response :success
  end

  test "should update languagedivision" do
    patch :update, id: @languagedivision, languagedivision: { book_id: @languagedivision.book_id, language_id: @languagedivision.language_id }
    assert_redirected_to languagedivision_path(assigns(:languagedivision))
  end

  test "should destroy languagedivision" do
    assert_difference('Languagedivision.count', -1) do
      delete :destroy, id: @languagedivision
    end

    assert_redirected_to languagedivisions_path
  end
end
