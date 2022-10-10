# frozen_string_literal: true

class AddTokenToSubscriptions < ActiveRecord::Migration[6.0]
  def change
    add_column :subscriptions, :token_id, :string
  end
end
