class AddCityToNonprofits < ActiveRecord::Migration[7.0]
  def change
    add_column :nonprofits, :city, :string
  end
end
