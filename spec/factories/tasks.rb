# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    title { 'Fix login page' }
    details { 'Right now' }
    doing_time { 4 }
    justification { 'Has a bug' }
    started_at { '2022-09-26 23:10:19' }
    finished_at { '2022-09-26 23:10:19' }
    list_id { '' }
    author_id { '' }
  end
end
