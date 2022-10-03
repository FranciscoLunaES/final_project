class TasksController < ApplicationController
  grant(
    member: :all,
    manager: :all,
    admin: :all
  )

  def create
    @board = Board.find(params[:board_id])
    @list = List.find(params[:list_id])
    @task = @list.tasks.new(task_params)
    if @task.save
      flash[:notice] = 'Task was created successfully'
      redirect_to @board
    else
      flash.now[:alert] = 'There was something wrong with your task'
    end
  end

  def update
    @board = Board.find(params[:board_id])
    @list = List.find(params[:list_id])
    @task = @list.tasks.find(params[:id])
    if @task.update(task_params)
      flash[:notice] = 'Article was updated successfully'
      redirect_to board_path(@board)
    else
      flash.now[:alert] = 'There was something wrong with your task'
    end
  end

  def destroy
    @board = Board.find(params[:board_id])
    @list = List.find(params[:list_id])
    @task = @list.tasks.find(params[:id])
    @task.destroy
    redirect_to board_path(@board)
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :doing_time, :justification, :started_at, :finished_at, :list_id)
  end
end
