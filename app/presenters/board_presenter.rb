class BoardPresenter
  def initialize(board)
    @boards = board
  end

  def public_boards
    @boards.select { |board| board if board.visibility == 'public' }
  end

  def private_boards
    @boards.select { |board| board.visibility == 'private' }
  end
end
