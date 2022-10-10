# frozen_string_literal: true

class AddBoardRefToLists < ActiveRecord::Migration[6.0]
  def change
    add_reference :lists, :board, null: false, foreign_key: true
  end
end
