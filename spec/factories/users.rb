FactoryBot.define do
  factory :user do
    name { 'somename' }
    surname { 'surename' }
    patronymic { 'patronymic' }
    age { 20}
    email { 'test@email.com' }
    nationality { 'Russian' }
    country { 'Russia' }
    gender { 'male' }
  end
end
