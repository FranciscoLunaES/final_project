# frozen_string_literal: true

json.board do
  json.extract! @board, :name, :description, :visibility, :image
  json.lists @board.lists do |list|
    json.extract! list, :name, :description, :priority
    json.tasks list.tasks do |task|
      json.extract! task, :title, :details, :doing_time, :justification, :started_at, :finished_at, :list_id
    end
  end
end
