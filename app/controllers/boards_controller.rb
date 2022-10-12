# frozen_string_literal: true

class BoardsController < ApplicationController
  before_action :set_board, only: %i[show update destroy]
  before_action :require_autorized, only: %i[update destroy] # looks like a model validation
  before_action :require_visible, only: %i[show] # same for this one
  before_action :set_user, only: %i[index team]

  grant(
    member: %i[index show],
    manager: :all,
    admin: :all
  )

  def team
    @team = User.all.where(manager_id: current_user)
  end

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
    @boards = Board.all
    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json
    end
  end

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

  def set_user
    @user = current_user
  end

  def set_board
    @board = Board.find(params[:id])
  end

  def board_params
    params.require(:board).permit(:name, :description, :visibility, :image)
  end

  def require_visible
    return unless private? && (owner? || teammate?)

    flash[:alert] = "You can't perform that action the board is not public"
    redirect_to boards_path
  end

  def reached_max_boards?
    current_user.boards.length > 10
  end
end
