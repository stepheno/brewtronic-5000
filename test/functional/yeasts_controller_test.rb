require 'test_helper'

class YeastsControllerTest < ActionController::TestCase
  setup do
    @yeast = yeasts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:yeasts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create yeast" do
    assert_difference('Yeast.count') do
      post :create, yeast: { efficiency: @yeast.efficiency, manufacturer: @yeast.manufacturer, name: @yeast.name, type: @yeast.type }
    end

    assert_redirected_to yeast_path(assigns(:yeast))
  end

  test "should show yeast" do
    get :show, id: @yeast
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @yeast
    assert_response :success
  end

  test "should update yeast" do
    put :update, id: @yeast, yeast: { efficiency: @yeast.efficiency, manufacturer: @yeast.manufacturer, name: @yeast.name, type: @yeast.type }
    assert_redirected_to yeast_path(assigns(:yeast))
  end

  test "should destroy yeast" do
    assert_difference('Yeast.count', -1) do
      delete :destroy, id: @yeast
    end

    assert_redirected_to yeasts_path
  end
end
