class AddMotivationToCandidatures < ActiveRecord::Migration[7.0]
  def change
    add_column :candidatures, :motivation, :text
  end
end
