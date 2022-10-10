# frozen_string_literal: true

class AddUserRefToBoards < ActiveRecord::Migration[6.0]
  def change
    add_reference :boards, :user, null: false, foreign_key: true
  end
end
