class AddStatusToCandidatures < ActiveRecord::Migration[7.0]
  def change
    add_column :candidatures, :status, :string, default: "nouveau"
  end
end
