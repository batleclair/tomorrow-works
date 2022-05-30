class CreateAssociations < ActiveRecord::Migration[7.0]
  def change
    create_table :associations do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.text :mission
      t.string :legal_form
      t.string :address
      t.string :sector
      t.text :description
      t.string :siret

      t.timestamps
    end
  end
end
