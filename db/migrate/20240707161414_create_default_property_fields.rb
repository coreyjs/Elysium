class CreateDefaultPropertyFields < ActiveRecord::Migration[7.1]
  def change
    create_table :default_property_fields do |t|
      t.string :name
      t.string :property_type
      t.string :export_name

      t.boolean :show, default: false
      t.boolean :default_for_root, default: false
      t.boolean :default_for_step, default: false

      t.timestamps
    end
  end
end
