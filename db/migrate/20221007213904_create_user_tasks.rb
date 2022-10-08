class CreateUserTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :user_tasks do |t|
      t.belongs_to :user
      t.belongs_to :task
    end
  end
end
