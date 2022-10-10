# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

puts 'Seeding...'

manager = User.create(email: Faker::Internet.email,
                      name: Faker::Name.first_name,
                      surname: Faker::Name.last_name,
                      security_updates: true,
                      authorization_tier: 'manager',
                      password: 'test123')
3.times do
  User.create(email: Faker::Internet.email,
              name: Faker::Name.first_name,
              surname: Faker::Name.last_name,
              security_updates: true,
              authorization_tier: 'member',
              password: 'test123',
              manager_id: manager.id)
end

admin = User.create(email: Faker::Internet.email,
                    name: Faker::Name.first_name,
                    surname: Faker::Name.last_name,
                    security_updates: true,
                    authorization_tier: 'admin',
                    password: 'test123')

Rails.logger.debug 'Users have been created'

board = Board.create(visibility: 'public',
                     name: Faker::Lorem.sentence(word_count: 1),
                     description: Faker::Lorem.sentence(word_count: 3),
                     user_id: manager.id)

Rails.logger.debug 'Board have been created'

list = List.create(name: Faker::Lorem.sentence(word_count: 1),
                   description: Faker::Lorem.sentence(word_count: 3),
                   priority: 'Low',
                   board_id: board.id)

Rails.logger.debug 'Lists have been created'

8.times do
  Task.create(title: Faker::Lorem.sentence(word_count: 3),
              started_at: Time.zone.now,
              finished_at: Time.zone.now,
              details: Faker::Lorem.sentence(word_count: 10),
              doing_time: Faker::Number.number(digits: 1),
              justification: Faker::Lorem.sentence(word_count: 10),
              list_id: list.id,
              author_id: manager.id)
end
Rails.logger.debug 'Tasks have been created'

3.times do
  Plan.create(name: Faker::Subscription.plan,
              description: Faker::Company.catch_phrase,
              quantity_members: Faker::Number.between(from: 1, to: 20),
              duration: Faker::Number.between(from: 1, to: 12),
              price_cents: Faker::Number.number(digits: 3),
              price_currency: Faker::Currency.code, user_id: admin.id)
end

Subscription.create(name: Faker::Subscription.plan,
                    quantity_members: Faker::Number.between(from: 1, to: 20),
                    duration: Faker::Number.between(from: 1, to: 12),
                    price_cents: Faker::Number.number(digits: 3),
                    price_currency: Faker::Currency.code,
                    active: true,
                    token_id: Faker::Lorem.characters(number: 10),
                    user_id: manager.id)

Rails.logger.debug 'Plans have been created'

4.times do
  Label.create(name: Faker::Lorem.sentence(word_count: 1),
               color: Faker::Color.hex_color)
end

Rails.logger.debug 'Labels have been created'
