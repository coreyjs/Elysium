require "application_system_test_case"

class Narrative::PropertyFieldsTest < ApplicationSystemTestCase
  setup do
    @narrative_property_field = narrative_property_fields(:one)
  end

  test "visiting the index" do
    visit narrative_property_fields_url
    assert_selector "h1", text: "Property fields"
  end

  test "should create property field" do
    visit narrative_property_fields_url
    click_on "New property field"

    click_on "Create Property field"

    assert_text "Property field was successfully created"
    click_on "Back"
  end

  test "should update Property field" do
    visit narrative_property_field_url(@narrative_property_field)
    click_on "Edit this property field", match: :first

    click_on "Update Property field"

    assert_text "Property field was successfully updated"
    click_on "Back"
  end

  test "should destroy Property field" do
    visit narrative_property_field_url(@narrative_property_field)
    click_on "Destroy this property field", match: :first

    assert_text "Property field was successfully destroyed"
  end
end
