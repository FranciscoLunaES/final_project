# frozen_string_literal: true

class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks, primary_key: :task_id do |t|
      t.string :title
      t.text :details
      t.integer :doing_time
      t.string :justification
      t.datetime :started_at
      t.datetime :finished_at

      t.timestamps
    end
  end
end
