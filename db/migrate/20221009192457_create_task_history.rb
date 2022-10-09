class CreateTaskHistory < ActiveRecord::Migration[6.0]
  def change
    create_table :task_histories do |t|
      t.belongs_to :task
      t.string :list_name

      t.timestamps
    end
  end
end
