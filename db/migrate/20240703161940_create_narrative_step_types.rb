class CreateNarrativeStepTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :narrative_step_types do |t|
      t.string :name
      t.string :code
      t.timestamps
    end

    add_index :narrative_step_types, :code, unique: true
  end
end
