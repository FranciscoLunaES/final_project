class UserTasksController < ApplicationController
  grant(
    manager: :all,
    admin: :all
  )

  def new; end

  def create
    @user_task = UserTask.new(user_tasks_params)
    if @user_task.save
      flash[:notice] = 'Assigment was created successfully'
      redirect_to request.referrer
    else
      flash.now[:alert] = 'There was something wrong with your assignment'
    end
  end

  private

  def user_tasks_params
    params.require(:user_task).permit(:user_id, :task_id)
  end
end
