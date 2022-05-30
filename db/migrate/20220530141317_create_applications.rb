class CreateApplications < ActiveRecord::Migration[7.0]
  def change
    create_table :applications do |t|
      t.references :offer, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :candidate, null: false, foreign_key: true
      t.text :message
      t.text :motivation
      t.string :step

      t.timestamps
    end
  end
end
