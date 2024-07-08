class CreateNarrativeSteps < ActiveRecord::Migration[7.1]
  def change
    create_table :narrative_steps do |t|
      t.string :name
      t.integer :ordinal, default: 0

      t.belongs_to :narrative_root, null: false, foreign_key: true
      t.timestamps
    end
  end
end
