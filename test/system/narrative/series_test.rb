require "application_system_test_case"

class Narrative::SeriesTest < ApplicationSystemTestCase
  setup do
    @narrative_series = narrative_series(:one)
  end

  test "visiting the index" do
    visit narrative_series_url
    assert_selector "h1", text: "Series"
  end

  test "should create series" do
    visit narrative_series_url
    click_on "New series"

    click_on "Create Series"

    assert_text "Series was successfully created"
    click_on "Back"
  end

  test "should update Series" do
    visit narrative_series_url(@narrative_series)
    click_on "Edit this series", match: :first

    click_on "Update Series"

    assert_text "Series was successfully updated"
    click_on "Back"
  end

  test "should destroy Series" do
    visit narrative_series_url(@narrative_series)
    click_on "Destroy this series", match: :first

    assert_text "Series was successfully destroyed"
  end
end
