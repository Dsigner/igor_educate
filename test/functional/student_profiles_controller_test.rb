require 'test_helper'

class StudentProfilesControllerTest < ActionController::TestCase
  setup do
    @student_profile = student_profiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:student_profiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student_profile" do
    assert_difference('StudentProfile.count') do
      post :create, student_profile: { about_me: @student_profile.about_me, avatar: @student_profile.avatar, name: @student_profile.name }
    end

    assert_redirected_to student_profile_path(assigns(:student_profile))
  end

  test "should show student_profile" do
    get :show, id: @student_profile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @student_profile
    assert_response :success
  end

  test "should update student_profile" do
    put :update, id: @student_profile, student_profile: { about_me: @student_profile.about_me, avatar: @student_profile.avatar, name: @student_profile.name }
    assert_redirected_to student_profile_path(assigns(:student_profile))
  end

  test "should destroy student_profile" do
    assert_difference('StudentProfile.count', -1) do
      delete :destroy, id: @student_profile
    end

    assert_redirected_to student_profiles_path
  end
end
