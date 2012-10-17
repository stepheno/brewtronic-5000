require 'test_helper'

class StylesControllerTest < ActionController::TestCase
  setup do
    @style = styles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:styles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create style" do
    assert_difference('Style.count') do
      post :create, style: { category: @style.category, fg_range_high: @style.fg_range_high, fg_range_low: @style.fg_range_low, ibu_range_high: @style.ibu_range_high, ibu_range_low: @style.ibu_range_low, name: @style.name, og_range_high: @style.og_range_high, og_range_low: @style.og_range_low, srm_range_high: @style.srm_range_high, srm_range_low: @style.srm_range_low, sub_category: @style.sub_category }
    end

    assert_redirected_to style_path(assigns(:style))
  end

  test "should show style" do
    get :show, id: @style
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @style
    assert_response :success
  end

  test "should update style" do
    put :update, id: @style, style: { category: @style.category, fg_range_high: @style.fg_range_high, fg_range_low: @style.fg_range_low, ibu_range_high: @style.ibu_range_high, ibu_range_low: @style.ibu_range_low, name: @style.name, og_range_high: @style.og_range_high, og_range_low: @style.og_range_low, srm_range_high: @style.srm_range_high, srm_range_low: @style.srm_range_low, sub_category: @style.sub_category }
    assert_redirected_to style_path(assigns(:style))
  end

  test "should destroy style" do
    assert_difference('Style.count', -1) do
      delete :destroy, id: @style
    end

    assert_redirected_to styles_path
  end
end
