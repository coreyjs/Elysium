class Narrative::Root < ApplicationRecord
  has_many :narrative_steps, :class_name => 'Narrative::Step', :foreign_key => 'narrative_root_id'
  has_many :narrative_property_fields, :as => :dynamic_model, :class_name => 'Narrative::PropertyField', dependent: :destroy
  belongs_to :narrative_series, class_name: 'Narrative::Series', foreign_key: 'narrative_series_id'

  has_one :project, through: :narrative_series

end

# == Schema Information
#
# Table name: narrative_roots
#
#  id                  :bigint           not null, primary key
#  title               :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  narrative_series_id :bigint           not null
#
# Indexes
#
#  index_narrative_roots_on_narrative_series_id  (narrative_series_id)
#
# Foreign Keys
#
#  fk_rails_...  (narrative_series_id => narrative_series.id)
#
