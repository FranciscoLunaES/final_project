class CreateBoards < ActiveRecord::Migration[6.0]
  def change
    create_table :boards do |t|
      t.string :visibility
      t.string :name
      t.string :description
    end
  end
end
