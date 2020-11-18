FactoryBot.define do
  factory :account do
    name { Faker::Name.name }
    company
  end
end
