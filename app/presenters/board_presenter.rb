# frozen_string_literal: true

class BoardPresenter
  def initialize(board, user)
    @boards = board
    @user = user
  end

  def public_boards
    @boards.select { |board| board.visibility == 'public' }
  end

  def private_boards
    @boards.select { |board| board.visibility == 'private' }
  end
end
