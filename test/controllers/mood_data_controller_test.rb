require 'test_helper'

class MoodDataControllerTest < ActionController::TestCase
  setup do
    @mood_datum = mood_data(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mood_data)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mood_datum" do
    assert_difference('MoodDatum.count') do
      post :create, mood_datum: { anxiety: @mood_datum.anxiety, comments: @mood_datum.comments, doctor_id: @mood_datum.doctor_id, entry_at: @mood_datum.entry_at, irritability: @mood_datum.irritability, mood: @mood_datum.mood, sleep: @mood_datum.sleep, user_id: @mood_datum.user_id }
    end

    assert_redirected_to mood_datum_path(assigns(:mood_datum))
  end

  test "should show mood_datum" do
    get :show, id: @mood_datum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mood_datum
    assert_response :success
  end

  test "should update mood_datum" do
    patch :update, id: @mood_datum, mood_datum: { anxiety: @mood_datum.anxiety, comments: @mood_datum.comments, doctor_id: @mood_datum.doctor_id, entry_at: @mood_datum.entry_at, irritability: @mood_datum.irritability, mood: @mood_datum.mood, sleep: @mood_datum.sleep, user_id: @mood_datum.user_id }
    assert_redirected_to mood_datum_path(assigns(:mood_datum))
  end

  test "should destroy mood_datum" do
    assert_difference('MoodDatum.count', -1) do
      delete :destroy, id: @mood_datum
    end

    assert_redirected_to mood_data_path
  end
end
