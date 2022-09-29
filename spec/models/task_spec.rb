require 'rails_helper'

RSpec.describe Task, type: :model do
  before(:all) do
    @user = create(:user)
    @board = create(:board, user_id: @user.id)
    @list = create(:list, board_id: @board.id)
    @task = build(:task, list_id: @list.id)
  end

  it 'creates a task if it is valid' do
    expect(@task).to be_valid
  end

  it "doesn't creates a board if visibility is not public or private" do
    @task.title = 'No'
    expect(@task).not_to be_valid
  end
end
