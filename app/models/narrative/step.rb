class Narrative::Step < ApplicationRecord
  has_many :narrative_property_fields, :as => :dynamic_model, :class_name => 'Narrative::PropertyField'
  belongs_to :narrative_root, class_name: 'Narrative::Root', foreign_key: 'narrative_root_id', dependent: :destroy
end

# == Schema Information
#
# Table name: narrative_steps
#
#  id                :bigint           not null, primary key
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  narrative_root_id :bigint           not null
#
# Indexes
#
#  index_narrative_steps_on_narrative_root_id  (narrative_root_id)
#
# Foreign Keys
#
#  fk_rails_...  (narrative_root_id => narrative_roots.id)
#
