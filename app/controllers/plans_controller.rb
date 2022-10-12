# frozen_string_literal: true

class PlansController < ApplicationController
  skip_before_action :authorize!, only: [:index]
  before_action :set_plan, only: %i[edit update destroy]

  grant(
    member: %i[index show],
    manager: %i[index show],
    admin: :all
  )

  def index
    @plans = Plan.all
  end

  def new; end

  def create
    @plan = Plan.new(plan_params)
    @plan.user = current_user
    if !reached_max_plans? # looks like a model method
      if @plan.save
        flash[:notice] = 'Plan was created successfully'
        redirect_to plans_path
      else
        flash.now[:alert] = 'There was something wrong with your plan'
      end
    else
      flash[:alert] = 'Reached maximum of 3 plans'
      redirect_to plans_path
    end
  end

  def edit; end

  def update
    if @plan.update(plan_params)
      flash[:notice] = 'Plan was updated successfully'
      redirect_to plans_path
    else
      flash.now[:alert] = 'There was something wrong with your plan'
    end
  end

  def destroy
    @plan.destroy
    redirect_to plans_path
  end

  private

  def set_plan
    @plan = Plan.find(params[:id])
  end

  def plan_params
    params.require(:plan).permit(:name, :description, :quantity_members, :duration, :price_cents, :price_currency,
                                 :image)
  end
end
