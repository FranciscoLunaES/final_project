# frozen_string_literal: true

require 'rails_helper'

RSpec.describe List, type: :model do
  before(:all) do
    @user = create(:user)
    @board = create(:board, user_id: @user.id)
    @list = build(:list, board_id: @board.id)
  end

  it 'creates a list if it is valid' do
    expect(@list).to be_valid
  end

  it "doesn't creates a board if visibility is not public or private" do
    @list.priority = 'Not at all low'
    expect(@list).not_to be_valid
  end
end
