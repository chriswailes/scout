require 'test_helper'

class ArcaneSchoolsControllerTest < ActionController::TestCase
  setup do
    @arcane_school = arcane_schools(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:arcane_schools)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create arcane_school" do
    assert_difference('ArcaneSchool.count') do
      post :create, arcane_school: { name: @arcane_school.name }
    end

    assert_redirected_to arcane_school_path(assigns(:arcane_school))
  end

  test "should show arcane_school" do
    get :show, id: @arcane_school
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @arcane_school
    assert_response :success
  end

  test "should update arcane_school" do
    put :update, id: @arcane_school, arcane_school: { name: @arcane_school.name }
    assert_redirected_to arcane_school_path(assigns(:arcane_school))
  end

  test "should destroy arcane_school" do
    assert_difference('ArcaneSchool.count', -1) do
      delete :destroy, id: @arcane_school
    end

    assert_redirected_to arcane_schools_path
  end
end
