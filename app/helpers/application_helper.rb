# frozen_string_literal: true

module ApplicationHelper
  def lists_for_select
    List.where(board_id: @board).collect { |l| [l.name, l.id] }
  end

  def admin?
    if current_user
      current_user.authorization_tier == 'admin'
    end
  end

  def labels_for_select
    Label.all.collect { |l| [l.name, l.id] }
  end

  def teammates_images
    User.where(manager_id: @board.user_id).select { |u| u.image.attached? }
  end

  def teammates_default_image
    all_teammates.length - teammates_images.length
  end

  def teammates_default_unselected(task)
    all_teammates.length - users_assigned(task).length - users_unassigned(task).length
  end

  def all_teammates
    User.where(manager_id: @board.user_id).collect { |u| [u.name, u.id] }
  end

  def teammates_with_image
    User.where(manager_id: @board.user_id).select { |u| u.image.attached? }.collect { |u| [u.image, u.id] }
  end

  def users_assigned(task)
    teammates_with_image.select { |_name, id| user_assigned_task?(task, id) }
  end

  def users_unassigned(task)
    all_teammates.reject { |_name, id| user_assigned_task?(task, id) }
  end

  def user_assigned_task?(task, id)
    UserTask.where(task_id: task).collect(&:user_id).include?(id)
  end

  def points_for_select
    [1, 2, 3, 4, 5, 8, 13]
  end

  def priority_for_select
    %w[High Medium Low]
  end

  def visibility_for_select
    %w[public private]
  end

  def task_labels(task)
    task_labels = TaskLabel.where(task_id: task).collect(&:label_id).uniq
    Label.where(id: task_labels)
  end

  def history_by_task(task)
    TaskHistory.where(task_id: task).order(created_at: :asc).collect do |u|
      [u.list_name, u.created_at.strftime('%d %b at %l:%M %P')]
    end
  end
end
