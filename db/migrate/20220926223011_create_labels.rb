# frozen_string_literal: true

class CreateLabels < ActiveRecord::Migration[6.0]
  def change
    create_table :labels do |t|
      t.string :color
      t.string :name
    end
  end
end
