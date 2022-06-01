class AddCompanySiretToCandidates < ActiveRecord::Migration[7.0]
  def change
    add_column :candidates, :company_siret, :string
  end
end
