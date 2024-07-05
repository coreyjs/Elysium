class CreateNarrativePropertyFields < ActiveRecord::Migration[7.1]
  def change
    create_table :narrative_property_fields do |t|
      t.string :name
      t.string :export_name
      t.integer :property_type, default: 0
      t.jsonb :value
      t.references :dynamic_model, polymorphic: true
      t.timestamps
    end
  end
end
