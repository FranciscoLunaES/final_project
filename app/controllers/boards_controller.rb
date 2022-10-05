class BoardsController < ApplicationController
  before_action :set_board, only: %i[show update destroy]
  before_action :require_autorized, only: %i[show update destroy]

  grant(
    member: %i[index show],
    manager: :all,
    admin: :all
  )

  def create
    @board = Board.new(board_params)
    @board.user = current_user
    if !reached_max_boards?
      if @board.save
        flash[:notice] = 'Board was created successfully'
        redirect_to boards_path
      else
        flash.now[:alert] = 'There was something wrong with your board'
      end
    else
      flash[:alert] = 'Reached maximum of 10 boards'
      redirect_to boards_path
    end
  end

  def index
    @user = current_user
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

  def require_autorized
    unless current_user.id == @board.user_id || @board.visibility == 'public'
      flash[:alert] = 'Only the owner or if is public can perform that action'
      redirect_to boards_path
    end
  end

  def reached_max_boards?
    current_user.boards.length > 10
  end
end
