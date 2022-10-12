# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include AuthorizedPersona::Authorization
  helper_method :logged_in?, :owner?, :subscribed?, :teammates, :reached_max_plans?

  authorize_persona class_name: 'User'

  def logged_in?
    !!current_user
  end

  def subscribed?
    if current_user
      current_user.subscriptions.where(active: 'true').empty?
    else
      false
    end
  end

  # if current_user.owner? || current_user.teammate? according to following revisions
  def require_permision
    return if owner? || teammate?

    # text should be included as translations
    flash[:alert] = 'Only the manager or teammate can perform that action'
    redirect_to @board
  end

  # look like a model method
  def teammate?
    current_user.manager_id == @board.user_id
  end

  def public? # could be called board_ to 
    # let developers know they'll need a board
    @board.visibility == 'public'
  end

  def private?
    @board.visibility == 'private'
  end

  # looks like a model method
  def owner?
    current_user.id == @board.user_id
  end

  def require_autorized
    return if owner? || teammate?

    flash[:alert] = 'Only the owner or a teammate can perform that action'
    redirect_to @board
  end

  def reached_max_plans?
    current_user.plans.length >= 3
  end
end
