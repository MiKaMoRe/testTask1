FactoryBot.define do
  factory :interest do
    sequence(:name)  { |n| "Some Interest #{n}" }
  end
end
