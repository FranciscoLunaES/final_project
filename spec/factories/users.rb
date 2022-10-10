# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    name { Faker::Internet.name }
    surname { Faker::Internet.name }
    security_updates { true }
    authorization_tier { 'member' }
    password { 'test123' }
  end
end
