class CreateNarrativeSteps < ActiveRecord::Migration[7.1]
  def change
    create_table :narrative_steps do |t|
      # t.string :iid
      # t.string :tracker_header
      # t.string :name
      # t.text :long_description
      # t.boolean :is_optional, default: false
      # t.integer :ordinal, default: 0
      # t.string :pre_step_gameplay_event_id, null: true
      # t.string :post_step_gameplay_event_id, null: true
      # t.references :next_narrative_step, null: true, foreign_key: { to_table: :narrative_steps }
      # t.float :quantity, default: 1.0


      t.belongs_to :narrative_root, null: false, foreign_key: true
      t.timestamps
    end
  end
end
