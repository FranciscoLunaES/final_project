require 'rails_helper'

RSpec.describe Board, type: :model do
  before(:all) do
    @user = create(:user)
    @board = build(:board, user_id: @user.id)
  end

  it 'creates a board if it is valid' do
    expect(@board).to be_valid
  end

  it "doesn't creates a board if visibility is not public or private" do
    @board.visibility = 'Not Private'
    expect(@board).not_to be_valid
  end
end
