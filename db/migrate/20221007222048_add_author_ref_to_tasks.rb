# frozen_string_literal: true

class AddAuthorRefToTasks < ActiveRecord::Migration[6.0]
  def change
    add_reference :tasks, :author, null: false, foreign_key: { to_table: :users }
  end
end
