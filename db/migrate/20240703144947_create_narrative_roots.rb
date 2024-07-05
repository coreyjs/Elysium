class CreateNarrativeRoots < ActiveRecord::Migration[7.1]
  def change
    create_table :narrative_roots do |t|
      t.string :title
      # t.string :long_description
      # t.string :header_description
      # t.string :completed_text
      # t.references :next_narrative_root, null: true, foreign_key: { to_table: :narrative_roots }
      # t.string :prerequsite_iids, array: true, default: []

      t.belongs_to :narrative_series, null: false, foreign_key: true

      t.timestamps
    end
  end
end
