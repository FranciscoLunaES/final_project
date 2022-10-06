class SubscriptionsController < ApplicationController
  skip_before_action :authorize!
  before_action :set_plan, only: %i[new create]
  before_action :set_subscription, only: %i[create]

  def new; end

  def create
    @subscription.user = current_user
    if @subscription.save
      flash[:notice] = 'Subscription was accomplished'
      redirect_to boards_path
    else
      flash.now[:alert] = 'There was something wrong with your subscription'
    end
  end

  private

  def set_plan
    @plan = Plan.find(params[:plan_id])
  end

  def set_subscription
    @subscription = Subscription.new(name: @plan.name, quantity_members: @plan.quantity_members,
                                     duration: @plan.duration, price_cents: @plan.price_cents,
                                     price_currency: @plan.price_currency, active: true)
  end
end
