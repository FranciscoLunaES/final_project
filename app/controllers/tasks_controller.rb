class TasksController < ApplicationController
  before_action :set_board, only: %i[create update destroy]
  before_action :set_list, only: %i[create update destroy]
  before_action :set_task, only: %i[update destroy]
  grant(
    member: :all,
    manager: :all,
    admin: :all
  )

  def create
    @task = @list.tasks.new(task_params)
    if @task.save
      flash[:notice] = 'Task was created successfully'
      redirect_to @board
    else
      flash.now[:alert] = 'There was something wrong with your task'
    end
  end

  def update
    if @task.update(task_params)
      flash[:notice] = 'Article was updated successfully'
      redirect_to board_path(@board)
    else
      flash.now[:alert] = 'There was something wrong with your task'
    end
  end

  def destroy
    @task.destroy
    redirect_to board_path(@board)
  end

  private

  def set_board
    @board = Board.find(params[:board_id])
  end

  def set_list
    @list = List.find(params[:list_id])
  end

  def set_task
    @task = @list.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details, :doing_time, :justification, :started_at, :finished_at, :list_id)
  end
end
