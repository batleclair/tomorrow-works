class AddValidationColumnsToCandidatures < ActiveRecord::Migration[7.0]
  def change
    add_column :candidatures, :candidate_validation, :boolean, default: false
    add_column :candidatures, :company_validation, :boolean, default: false
  end
end
