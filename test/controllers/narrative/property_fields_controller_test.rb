require "test_helper"

class Narrative::PropertyFieldsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @narrative_property_field = narrative_property_fields(:one)
  end

  test "should get index" do
    get narrative_property_fields_url
    assert_response :success
  end

  test "should get new" do
    get new_narrative_property_field_url
    assert_response :success
  end

  test "should create narrative_property_field" do
    assert_difference("Narrative::PropertyField.count") do
      post narrative_property_fields_url, params: { narrative_property_field: {  } }
    end

    assert_redirected_to narrative_property_field_url(Narrative::PropertyField.last)
  end

  test "should show narrative_property_field" do
    get narrative_property_field_url(@narrative_property_field)
    assert_response :success
  end

  test "should get edit" do
    get edit_narrative_property_field_url(@narrative_property_field)
    assert_response :success
  end

  test "should update narrative_property_field" do
    patch narrative_property_field_url(@narrative_property_field), params: { narrative_property_field: {  } }
    assert_redirected_to narrative_property_field_url(@narrative_property_field)
  end

  test "should destroy narrative_property_field" do
    assert_difference("Narrative::PropertyField.count", -1) do
      delete narrative_property_field_url(@narrative_property_field)
    end

    assert_redirected_to narrative_property_fields_url
  end
end
