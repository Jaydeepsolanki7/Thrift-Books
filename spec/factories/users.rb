FactoryBot.define do
  factory :user do
    name {Faker::Name.name}
    email {Faker::Internet.safe_email}
    password {Faker::Internet.password}
    confirmed_at {Time.now}
  end
end
