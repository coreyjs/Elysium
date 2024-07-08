require "test_helper"

class Narrative::StepsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @narrative_step = narrative_steps(:one)
  end

  test "should get index" do
    get narrative_steps_url
    assert_response :success
  end

  test "should get new" do
    get new_narrative_step_url
    assert_response :success
  end

  test "should create narrative_step" do
    assert_difference("Narrative::Step.count") do
      post narrative_steps_url, params: { narrative_step: {  } }
    end

    assert_redirected_to narrative_step_url(Narrative::Step.last)
  end

  test "should show narrative_step" do
    get narrative_step_url(@narrative_step)
    assert_response :success
  end

  test "should get edit" do
    get edit_narrative_step_url(@narrative_step)
    assert_response :success
  end

  test "should update narrative_step" do
    patch narrative_step_url(@narrative_step), params: { narrative_step: {  } }
    assert_redirected_to narrative_step_url(@narrative_step)
  end

  test "should destroy narrative_step" do
    assert_difference("Narrative::Step.count", -1) do
      delete narrative_step_url(@narrative_step)
    end

    assert_redirected_to narrative_steps_url
  end
end
