class DefaultPropertyField < ApplicationRecord
end

# == Schema Information
#
# Table name: default_property_fields
#
#  id               :bigint           not null, primary key
#  default_for_root :boolean          default(FALSE)
#  default_for_step :boolean          default(FALSE)
#  export_name      :string
#  name             :string
#  property_type    :string
#  show             :boolean          default(FALSE)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
