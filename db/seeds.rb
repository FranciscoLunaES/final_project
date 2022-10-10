# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

puts 'Seeding...'

user = User.create(email: Faker::Internet.email,
                   name: Faker::Name.name,
                   surname: Faker::Name.name,
                   security_updates: true,
                   authorization_tier: 'member',
                   password: 'test123')

board = Board.create(visibility: 'public',
                     name: 'TaskTaker',
                     description: 'Current project',
                     user_id: user.id)

list = List.create(name: 'testing',
                   description: 'Before deploy',
                   priority: 'Low',
                   board_id: board.id)

Task.create(title: 'Fix login page',
            details: 'Right now',
            doing_time: 4,
            justification: 'Has a bug',
            started_at: '2022-09-26 23:10:19',
            finished_at: '2022-09-26 23:10:19',
            list_id: list.id,
            author_id: user.id)

Plan.create(name: Faker::Subscription.plan,
            description: Faker::Company.catch_phrase,
            quantity_members: Faker::Number.between(from: 1, to: 20),
            duration: Faker::Number.between(from: 1, to: 12),
            price_cents: Faker::Number.number(digits: 3),
            price_currency: Faker::Currency.code, user_id: user.id)

Label.create(name: 'bug',
             color: 'red')

puts 'Seeding done.'
