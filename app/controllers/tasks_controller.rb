# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :set_board, only: %i[create update destroy]
  before_action :set_list, only: %i[create update destroy]
  before_action :set_task, only: %i[update destroy]
  before_action :require_permision, only: %i[create]
  before_action :require_ownership, only: %i[update destroy]

  grant(
    member: :all,
    manager: :all,
    admin: :all
  )

  def create
    @task = @list.tasks.new(task_params)
    @task.user = current_user
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
    params.require(:task).permit(:title, :details, :doing_time, :justification, :started_at, :finished_at, :list_id,
                                 :image)
  end

  def require_ownership
    return if owner? || task_owner? # could be changed to current_user.owner?
    # this is not authorization_persona style, this is another approach to permissions.

    flash[:alert] = 'Only the manager or the task owner can perform that action'
    redirect_to @board
  end

  def task_owner?
    current_user.id == @task.author_id
  end
end
