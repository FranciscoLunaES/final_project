class ListsController < ApplicationController
  grant(
    member: :all,
    manager: :all,
    admin: :all
  )

  def create
    @board = Board.find(params[:board_id])
    @list = @board.lists.new(list_params)
    if @list.save
      flash[:notice] = 'List was created successfully'
      redirect_to @board
    else
      flash.now[:alert] = 'There was something wrong with your list'
    end
  end

  def update
    @board = Board.find(params[:board_id])
    @list = @board.lists.find(params[:id])
    if @list.update(list_params)
      flash[:notice] = 'List was updated successfully'
      redirect_to @board
    else
      flash.now[:alert] = 'There was something wrong with your list'
    end
  end

  def destroy
    @board = Board.find(params[:board_id])
    @list = @board.lists.find(params[:id])
    @list.destroy
    redirect_to board_path(@board)
  end

  private

  def list_params
    params.require(:list).permit(:name, :description, :priority)
  end
end
