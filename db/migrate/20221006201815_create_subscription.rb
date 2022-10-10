# frozen_string_literal: true

class CreateSubscription < ActiveRecord::Migration[6.0]
  def change
    create_table :subscriptions do |t|
      t.belongs_to :user
      t.string :name
      t.integer :quantity_members
      t.integer :duration
      t.monetize :price
      t.boolean :active
      t.timestamps
    end
  end
end
