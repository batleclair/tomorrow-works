class AddStatusFirstNameLastNameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :status, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
  end
end
