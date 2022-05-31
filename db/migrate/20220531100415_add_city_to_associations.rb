class AddCityToAssociations < ActiveRecord::Migration[7.0]
  def change
    add_column :associations, :city, :string
  end
end
