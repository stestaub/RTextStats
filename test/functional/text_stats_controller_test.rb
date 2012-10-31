require 'test_helper'

class TextStatsControllerTest < ActionController::TestCase
  setup do
    @text_stat = text_stats(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:text_stats)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create text_stat" do
    assert_difference('TextStat.count') do
      post :create, text_stat: { content: @text_stat.content, name: @text_stat.name }
    end

    assert_redirected_to text_stat_path(assigns(:text_stat))
  end

  test "should show text_stat" do
    get :show, id: @text_stat
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @text_stat
    assert_response :success
  end

  test "should update text_stat" do
    put :update, id: @text_stat, text_stat: { content: @text_stat.content, name: @text_stat.name }
    assert_redirected_to text_stat_path(assigns(:text_stat))
  end

  test "should destroy text_stat" do
    assert_difference('TextStat.count', -1) do
      delete :destroy, id: @text_stat
    end

    assert_redirected_to text_stats_path
  end
end
