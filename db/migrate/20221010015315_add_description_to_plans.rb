# frozen_string_literal: true

class AddDescriptionToPlans < ActiveRecord::Migration[6.0]
  def change
    add_column :plans, :description, :string
  end
end
