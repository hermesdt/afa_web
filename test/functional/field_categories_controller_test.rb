require 'test_helper'

class FieldCategoriesControllerTest < ActionController::TestCase
  setup do
    @field_category = field_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:field_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create field_category" do
    assert_difference('FieldCategory.count') do
      post :create, :field_category => @field_category.attributes
    end

    assert_redirected_to field_category_path(assigns(:field_category))
  end

  test "should show field_category" do
    get :show, :id => @field_category.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @field_category.to_param
    assert_response :success
  end

  test "should update field_category" do
    put :update, :id => @field_category.to_param, :field_category => @field_category.attributes
    assert_redirected_to field_category_path(assigns(:field_category))
  end

  test "should destroy field_category" do
    assert_difference('FieldCategory.count', -1) do
      delete :destroy, :id => @field_category.to_param
    end

    assert_redirected_to field_categories_path
  end
end
