require "test_helper"

class Narrative::RootsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @narrative_root = narrative_roots(:one)
  end

  test "should get index" do
    get narrative_roots_url
    assert_response :success
  end

  test "should get new" do
    get new_narrative_root_url
    assert_response :success
  end

  test "should create narrative_root" do
    assert_difference("Narrative::Root.count") do
      post narrative_roots_url, params: { narrative_root: {  } }
    end

    assert_redirected_to narrative_root_url(Narrative::Root.last)
  end

  test "should show narrative_root" do
    get narrative_root_url(@narrative_root)
    assert_response :success
  end

  test "should get edit" do
    get edit_narrative_root_url(@narrative_root)
    assert_response :success
  end

  test "should update narrative_root" do
    patch narrative_root_url(@narrative_root), params: { narrative_root: {  } }
    assert_redirected_to narrative_root_url(@narrative_root)
  end

  test "should destroy narrative_root" do
    assert_difference("Narrative::Root.count", -1) do
      delete narrative_root_url(@narrative_root)
    end

    assert_redirected_to narrative_roots_url
  end
end
