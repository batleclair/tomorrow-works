class RemoveSiretFromCandidates < ActiveRecord::Migration[7.0]
  def change
    remove_column :candidates, :company_siret, :string
  end
end
