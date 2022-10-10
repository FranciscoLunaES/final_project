# frozen_string_literal: true

FactoryBot.define do
  factory :board do
    visibility { 'public' }
    name { 'TaskTaker' }
    description { 'Current project' }
    user_id { '' }
  end
end
