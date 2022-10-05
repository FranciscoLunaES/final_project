class AddUserRefToPlans < ActiveRecord::Migration[6.0]
  def change
    add_reference :plans, :user, null: false, foreign_key: true
  end
end
