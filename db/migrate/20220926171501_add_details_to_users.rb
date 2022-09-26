class AddDetailsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :surname, :string
    add_column :users, :security_updates, :boolean
    add_column :users, :authorization_tier, :string
  end
end
