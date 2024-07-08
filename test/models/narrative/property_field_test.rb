# == Schema Information
#
# Table name: narrative_property_fields
#
#  id                 :bigint           not null, primary key
#  dynamic_model_type :string
#  export_name        :string
#  name               :string
#  property_type      :integer          default("string")
#  show               :boolean          default(FALSE)
#  value              :jsonb
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  dynamic_model_id   :bigint
#
# Indexes
#
#  index_narrative_property_fields_on_dynamic_model  (dynamic_model_type,dynamic_model_id)
#
require "test_helper"

class Narrative::PropertyFieldTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
