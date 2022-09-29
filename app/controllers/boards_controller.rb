class BoardsController < ApplicationController
  grant(
    member: %i[index show],
    manager: :all,
    admin: :all
  )

  def index
    @boards = Board.all
  end
end
