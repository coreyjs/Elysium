require "test_helper"

class DefaultPropertyFieldsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @default_property_field = default_property_fields(:one)
  end

  test "should get index" do
    get default_property_fields_url
    assert_response :success
  end

  test "should get new" do
    get new_default_property_field_url
    assert_response :success
  end

  test "should create default_property_field" do
    assert_difference("DefaultPropertyField.count") do
      post default_property_fields_url, params: { default_property_field: {  } }
    end

    assert_redirected_to default_property_field_url(DefaultPropertyField.last)
  end

  test "should show default_property_field" do
    get default_property_field_url(@default_property_field)
    assert_response :success
  end

  test "should get edit" do
    get edit_default_property_field_url(@default_property_field)
    assert_response :success
  end

  test "should update default_property_field" do
    patch default_property_field_url(@default_property_field), params: { default_property_field: {  } }
    assert_redirected_to default_property_field_url(@default_property_field)
  end

  test "should destroy default_property_field" do
    assert_difference("DefaultPropertyField.count", -1) do
      delete default_property_field_url(@default_property_field)
    end

    assert_redirected_to default_property_fields_url
  end
end
