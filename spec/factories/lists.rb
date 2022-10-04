FactoryBot.define do
  factory :list do
    name { 'testing' }
    description { 'Before deploy' }
    priority { 'Low' }
    board_id { '' }
  end
end
