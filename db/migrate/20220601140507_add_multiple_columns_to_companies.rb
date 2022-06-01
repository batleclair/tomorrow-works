class AddMultipleColumnsToCompanies < ActiveRecord::Migration[7.0]
  def change
    add_column :companies, :sector, :string
    add_column :companies, :address, :string
    add_column :companies, :status, :text
    add_column :companies, :siret, :string
  end
end
