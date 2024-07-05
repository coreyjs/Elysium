class CreateNarrativeSeries < ActiveRecord::Migration[7.1]
  def change
    create_table :narrative_series do |t|
      t.string :title
      t.string :description
      t.string :export_name
      t.belongs_to :project, null: false, foreign_key: true
      t.timestamps
    end
  end
end
