class CreateOffers < ActiveRecord::Migration[7.0]
  def change
    create_table :offers do |t|
      t.references :user, null: false, foreign_key: true
      t.date :start_date
      t.integer :duration
      t.text :description
      t.integer :frequency
      t.string :location
      t.string :title
      t.text :expertise
      t.integer :salary
      t.references :association, null: false, foreign_key: true

      t.timestamps
    end
  end
end
