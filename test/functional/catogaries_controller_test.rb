require 'test_helper'

class CatogariesControllerTest < ActionController::TestCase
  setup do
    @catogary = catogaries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:catogaries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create catogary" do
    assert_difference('Catogary.count') do
      post :create, catogary: { name: @catogary.name }
    end

    assert_redirected_to catogary_path(assigns(:catogary))
  end

  test "should show catogary" do
    get :show, id: @catogary
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @catogary
    assert_response :success
  end

  test "should update catogary" do
    put :update, id: @catogary, catogary: { name: @catogary.name }
    assert_redirected_to catogary_path(assigns(:catogary))
  end

  test "should destroy catogary" do
    assert_difference('Catogary.count', -1) do
      delete :destroy, id: @catogary
    end

    assert_redirected_to catogaries_path
  end
end
