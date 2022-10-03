class BoardsController < ApplicationController
  before_action :set_board, only: %i[show update destroy]
  grant(
    member: %i[index show],
    manager: :all,
    admin: :all
  )

  def create
    @board = Board.new(board_params)
    @board.user = current_user
    if @board.save
      flash[:notice] = 'Board was created successfully'
      redirect_to boards_path
    else
      flash.now[:alert] = 'There was something wrong with your board'
    end
  end

  def index
    @boards = Board.all
  end

  def show; end

  def update
    if @board.update(board_params)
      flash[:notice] = 'Board was updated successfully'
      redirect_to boards_path
    else
      flash.now[:alert] = 'There was something wrong with your board'
    end
  end

  def destroy
    @board.destroy
    redirect_to board_path(@board)
  end

  private

  def set_board
    @board = Board.find(params[:id])
  end

  def board_params
    params.require(:board).permit(:name, :description, :visibility)
  end
end
