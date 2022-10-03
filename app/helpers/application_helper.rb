# frozen_string_literal: true

module ApplicationHelper
  def lists_for_select
    List.all.collect { |l| [l.name, l.id] }
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
end
