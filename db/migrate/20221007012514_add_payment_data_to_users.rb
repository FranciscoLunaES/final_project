# frozen_string_literal: true

class AddPaymentDataToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :customer_id, :string
    add_column :users, :card_id, :string
  end
end
