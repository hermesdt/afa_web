require 'test_helper'

class TechniqueTemplatesControllerTest < ActionController::TestCase
  setup do
    @technique_template = technique_templates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:technique_templates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create technique_template" do
    assert_difference('TechniqueTemplate.count') do
      post :create, :technique_template => @technique_template.attributes
    end

    assert_redirected_to technique_template_path(assigns(:technique_template))
  end

  test "should show technique_template" do
    get :show, :id => @technique_template.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @technique_template.to_param
    assert_response :success
  end

  test "should update technique_template" do
    put :update, :id => @technique_template.to_param, :technique_template => @technique_template.attributes
    assert_redirected_to technique_template_path(assigns(:technique_template))
  end

  test "should destroy technique_template" do
    assert_difference('TechniqueTemplate.count', -1) do
      delete :destroy, :id => @technique_template.to_param
    end

    assert_redirected_to technique_templates_path
  end
end
