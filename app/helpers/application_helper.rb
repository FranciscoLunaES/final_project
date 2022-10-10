# frozen_string_literal: true

module ApplicationHelper
  def lists_for_select
    List.all.collect { |l| [l.name, l.id] }
  end

  def labels_for_select
    Label.all.collect { |l| [l.name, l.id] }
  end

  def teammates_images
    User.where(manager_id: @board.user_id).select { |u| u.image.attached? }
  end

  def teammates_default_image
    teammates_select.length - teammates_images.length
  end

  def teammates_select
    User.where(manager_id: @board.user_id).collect { |u| [u.name, u.id] }
  end

  def users_assigned(task)
    teammates_select.select { |_name, id| user_assigned_task?(task, id) }
  end

  def users_unassigned(task)
    teammates_select.reject { |_name, id| user_assigned_task?(task, id) }
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
