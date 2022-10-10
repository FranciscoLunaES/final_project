# frozen_string_literal: true

class LabelsController < ApplicationController
  skip_before_action :authorize!

  def create
    @label = Label.new(label_params)
    if @label.save
      flash[:notice] = 'Label was created successfully'
      redirect_to boards_path
    else
      flash.now[:alert] = 'There was something wrong with your label'
    end
  end

  private

  def label_params
    params.require(:label).permit(:name, :color)
  end
end
