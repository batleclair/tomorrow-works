class CreateCandidates < ActiveRecord::Migration[7.0]
  def change
    create_table :candidates do |t|
      t.references :user, null: false, foreign_key: true
      t.references :company, null: false, foreign_key: true
      t.date :birthdate
      t.integer :availability
      t.string :expertise
      t.string :location
      t.string :linkedin_url

      t.timestamps
    end
  end
end
