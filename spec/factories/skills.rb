FactoryBot.define do
  factory :skill do
    sequence(:name)  { |n| "Some Skill #{n}" }
  end
end
