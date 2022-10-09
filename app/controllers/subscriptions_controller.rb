class SubscriptionsController < ApplicationController
  skip_before_action :authorize!
  before_action :set_plan, only: %i[new create]
  before_action :set_subscription, only: %i[create]

  def new; end

  def create
    @subscription.user = current_user
    payment = Payment.create_payment(@subscription.name, @subscription.price_cents, current_user.customer_id,
                                     @subscription.price_currency, current_user.card_id)
    @subscription.token_id = payment.id
    if @subscription.save
      current_user.update(authorization_tier: 'manager')
      SendEmailFinishedSubscriptionWorker.perform_at(@subscription.created_at +
        @subscription.duration.months, current_user.id)
      flash[:notice] = 'Subscription was accomplished'
      redirect_to boards_path
    else
      flash.now[:alert] = 'There was something wrong with your subscription'
    end
  end

  def card
    card = Payment.add_card(params[:number], params[:exp_month], params[:exp_year], params[:cvc],
                            current_user.customer_id)
    if current_user.update_attributes(card_id: card.card.id)
      flash[:notice] = 'Card was added successfully'
      redirect_to request.referrer
    else
      flash[:alert] = 'There was something wrong with your card'
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
