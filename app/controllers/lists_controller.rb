class ListsController < ApplicationController
  before_action :set_board, only: %i[create update destroy]
  before_action :set_list, only: %i[update destroy]
  grant(
    member: :all,
    manager: :all,
    admin: :all
  )

  def create
    @list = @board.lists.new(list_params)
    if !reached_max_lists?
      if @list.save
        flash[:notice] = 'List was created successfully'
        redirect_to @board
      else
        flash.now[:alert] = 'There was something wrong with your list'
      end
    else
      flash.now[:alert] = 'Reached maximum of 50 lists in this board'
    end
  end

  def update
    if @list.update(list_params)
      flash[:notice] = 'List was updated successfully'
      redirect_to @board
    else
      flash.now[:alert] = 'There was something wrong with your list'
    end
  end

  def destroy
    @list.destroy
    redirect_to board_path(@board)
  end

  private

  def set_board
    @board = Board.find(params[:board_id])
  end

  def set_list
    @list = @board.lists.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :description, :priority)
  end

  def reached_max_lists?
    @board.lists.length > 50
  end
end
