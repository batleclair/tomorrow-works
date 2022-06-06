class CreateCvs < ActiveRecord::Migration[7.0]
  def change
    create_table :cvs do |t|
      t.string :titre
      t.string :entreprise
      t.text :description
      t.date :date_début
      t.date :date_fin
      t.references :candidate, null: false, foreign_key: true

      t.timestamps
    end
  end
end
