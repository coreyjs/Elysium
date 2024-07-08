require "application_system_test_case"

class DefaultPropertyFieldsTest < ApplicationSystemTestCase
  setup do
    @default_property_field = default_property_fields(:one)
  end

  test "visiting the index" do
    visit default_property_fields_url
    assert_selector "h1", text: "Default property fields"
  end

  test "should create default property field" do
    visit default_property_fields_url
    click_on "New default property field"

    click_on "Create Default property field"

    assert_text "Default property field was successfully created"
    click_on "Back"
  end

  test "should update Default property field" do
    visit default_property_field_url(@default_property_field)
    click_on "Edit this default property field", match: :first

    click_on "Update Default property field"

    assert_text "Default property field was successfully updated"
    click_on "Back"
  end

  test "should destroy Default property field" do
    visit default_property_field_url(@default_property_field)
    click_on "Destroy this default property field", match: :first

    assert_text "Default property field was successfully destroyed"
  end
end
