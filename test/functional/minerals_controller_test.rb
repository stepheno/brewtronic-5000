require 'test_helper'

class MineralsControllerTest < ActionController::TestCase
  setup do
    @mineral = minerals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:minerals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mineral" do
    assert_difference('Mineral.count') do
      post :create, mineral: { calcium: @mineral.calcium, carbonate: @mineral.carbonate, chloride: @mineral.chloride, magnesium: @mineral.magnesium, name: @mineral.name, sodium: @mineral.sodium, sulfate: @mineral.sulfate }
    end

    assert_redirected_to mineral_path(assigns(:mineral))
  end

  test "should show mineral" do
    get :show, id: @mineral
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mineral
    assert_response :success
  end

  test "should update mineral" do
    put :update, id: @mineral, mineral: { calcium: @mineral.calcium, carbonate: @mineral.carbonate, chloride: @mineral.chloride, magnesium: @mineral.magnesium, name: @mineral.name, sodium: @mineral.sodium, sulfate: @mineral.sulfate }
    assert_redirected_to mineral_path(assigns(:mineral))
  end

  test "should destroy mineral" do
    assert_difference('Mineral.count', -1) do
      delete :destroy, id: @mineral
    end

    assert_redirected_to minerals_path
  end
end
