# frozen_string_literal: true

class AddListRefToTasks < ActiveRecord::Migration[6.0]
  def change
    add_reference :tasks, :list, null: false, foreign_key: true
  end
end
