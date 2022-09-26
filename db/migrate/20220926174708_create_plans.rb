class CreatePlans < ActiveRecord::Migration[6.0]
  def change
    create_table :plans do |t|
      t.string :name
      t.integer :quantity_members
      t.integer :duration
      t.monetize :price

      t.timestamps
    end
  end
end
