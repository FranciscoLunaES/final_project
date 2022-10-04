class TagsController < ApplicationController
  skip_before_action :authorize!

  def create
    @tasklabel = TaskLabel.new(label_id: params[:label_id], task_id: params[:task_id])
    if @tasklabel.save
      flash[:notice] = 'TaskLabel was created successfully'
      redirect_to request.referrer
    else
      flash.now[:alert] = 'There was something wrong with your tasklabel'
    end
  end
end
