class Narrative::Root < ApplicationRecord
  has_many :narrative_steps, :class_name => 'Narrative::Step', :foreign_key => 'narrative_root_id'
  has_many :narrative_property_fields, -> { order(name: :asc) }, :as => :dynamic_model, :class_name => 'Narrative::PropertyField', dependent: :destroy
  belongs_to :narrative_series, class_name: 'Narrative::Series', foreign_key: 'narrative_series_id'

  has_one :project, through: :narrative_series

  def self.find_or_create_with_defaults!(*args)
    options = args.extract_options!
    n_root = find_or_create_by!(options)
    default_property_fields = DefaultPropertyField.where(default_for_root: true)
    default_property_fields.each do |dpf|
      n_root.narrative_property_fields.find_or_create_by!(
        name: dpf.name,
        property_type: dpf.property_type,
        export_name: dpf.export_name,
        show: dpf.show
      )
    end

    n_root
  end

  def self.new_with_defaults!(attributes = {})
    n_root = new(attributes)
    default_property_fields = DefaultPropertyField.where(default_for_root: true)
    default_property_fields.each do |dpf|
      n_root.narrative_property_fields.build(
        name: dpf.name,
        property_type: dpf.property_type,
        export_name: dpf.export_name,
        show: dpf.show
      )
    end

    n_root
  end

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
