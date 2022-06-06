class AddInfoToOffers < ActiveRecord::Migration[7.0]
  def change
    add_column :offers, :info, :text
  end
end
