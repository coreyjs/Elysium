class Narrative::PropertyField < ApplicationRecord
  belongs_to :dynamic_model, polymorphic: true

  enum :property_type, [ :string, :integer, :decimal, :boolean ],
       prefix: true,
       default: :string,
       scopes: true
end

# == Schema Information
#
# Table name: narrative_property_fields
#
#  id                 :bigint           not null, primary key
#  dynamic_model_type :string
#  export_name        :string
#  name               :string
#  property_type      :integer          default("string")
#  value              :jsonb
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  dynamic_model_id   :bigint
#
# Indexes
#
#  index_narrative_property_fields_on_dynamic_model  (dynamic_model_type,dynamic_model_id)
#
