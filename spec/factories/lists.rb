FactoryBot.define do
  factory :list do
    name { 'testing' }
    description { 'Before deploy' }
    priority { 'low' }
    board_id { '' }
  end
end
