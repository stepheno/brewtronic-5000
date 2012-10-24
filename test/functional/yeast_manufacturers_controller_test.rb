require 'test_helper'

class YeastManufacturersControllerTest < ActionController::TestCase
  setup do
    @yeast_manufacturer = yeast_manufacturers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:yeast_manufacturers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create yeast_manufacturer" do
    assert_difference('YeastManufacturer.count') do
      post :create, yeast_manufacturer: { name: @yeast_manufacturer.name }
    end

    assert_redirected_to yeast_manufacturer_path(assigns(:yeast_manufacturer))
  end

  test "should show yeast_manufacturer" do
    get :show, id: @yeast_manufacturer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @yeast_manufacturer
    assert_response :success
  end

  test "should update yeast_manufacturer" do
    put :update, id: @yeast_manufacturer, yeast_manufacturer: { name: @yeast_manufacturer.name }
    assert_redirected_to yeast_manufacturer_path(assigns(:yeast_manufacturer))
  end

  test "should destroy yeast_manufacturer" do
    assert_difference('YeastManufacturer.count', -1) do
      delete :destroy, id: @yeast_manufacturer
    end

    assert_redirected_to yeast_manufacturers_path
  end
end
