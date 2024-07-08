require "application_system_test_case"

class Narrative::StepsTest < ApplicationSystemTestCase
  setup do
    @narrative_step = narrative_steps(:one)
  end

  test "visiting the index" do
    visit narrative_steps_url
    assert_selector "h1", text: "Steps"
  end

  test "should create step" do
    visit narrative_steps_url
    click_on "New step"

    click_on "Create Step"

    assert_text "Step was successfully created"
    click_on "Back"
  end

  test "should update Step" do
    visit narrative_step_url(@narrative_step)
    click_on "Edit this step", match: :first

    click_on "Update Step"

    assert_text "Step was successfully updated"
    click_on "Back"
  end

  test "should destroy Step" do
    visit narrative_step_url(@narrative_step)
    click_on "Destroy this step", match: :first

    assert_text "Step was successfully destroyed"
  end
end
