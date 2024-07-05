require "test_helper"

class Narrative::SeriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @narrative_series = narrative_series(:one)
  end

  test "should get index" do
    get narrative_series_index_url
    assert_response :success
  end

  test "should get new" do
    get new_narrative_series_url
    assert_response :success
  end

  test "should create narrative_series" do
    assert_difference("Narrative::Series.count") do
      post narrative_series_index_url, params: { narrative_series: {  } }
    end

    assert_redirected_to narrative_series_url(Narrative::Series.last)
  end

  test "should show narrative_series" do
    get narrative_series_url(@narrative_series)
    assert_response :success
  end

  test "should get edit" do
    get edit_narrative_series_url(@narrative_series)
    assert_response :success
  end

  test "should update narrative_series" do
    patch narrative_series_url(@narrative_series), params: { narrative_series: {  } }
    assert_redirected_to narrative_series_url(@narrative_series)
  end

  test "should destroy narrative_series" do
    assert_difference("Narrative::Series.count", -1) do
      delete narrative_series_url(@narrative_series)
    end

    assert_redirected_to narrative_series_index_url
  end
end
