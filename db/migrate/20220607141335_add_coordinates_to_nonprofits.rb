class AddCoordinatesToNonprofits < ActiveRecord::Migration[7.0]
  def change
    add_column :nonprofits, :latitude, :float
    add_column :nonprofits, :longitude, :float
  end
end
