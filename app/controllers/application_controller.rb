# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include AuthorizedPersona::Authorization
  helper_method :logged_in?, :owner?, :subscribed?

  authorize_persona class_name: 'User'

  def logged_in?
    !!current_user
  end

  def subscribed?
    current_user.subscriptions.where(active: 'true')
  end

  def teammate?
    current_user.manager_id == @board.user_id
  end

  def public?
    @board.visibility == 'public'
  end

  def private?
    @board.visibility == 'private'
  end

  def owner?
    current_user.id == @board.user_id
  end

  def require_autorized
    unless owner? || teammate?
      flash[:alert] = 'Only the owner or a teammate can perform that action'
      redirect_to @board
    end
  end
end
