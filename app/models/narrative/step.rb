class Narrative::Step < ApplicationRecord
  has_many :narrative_property_fields, :as => :dynamic_model, :class_name => 'Narrative::PropertyField'
  belongs_to :narrative_root, class_name: 'Narrative::Root', foreign_key: 'narrative_root_id', dependent: :destroy

  has_one :project, through: :narrative_root


  def self.new_with_defaults!(attributes={})
    n_step = new(attributes)
    default_property_fields = DefaultPropertyField.where(default_for_step: true)
    default_property_fields.each do |dpf|
      n_step.narrative_property_fields.build(
        name: dpf.name,
        property_type: dpf.property_type,
        export_name: dpf.export_name,
        show: dpf.show
      )
    end

    n_step
  end

end

# == Schema Information
#
# Table name: narrative_steps
#
#  id                :bigint           not null, primary key
#  name              :string
#  ordinal           :integer          default(0)
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
