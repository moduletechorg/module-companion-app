FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { "password" }
    password_confirmation { "password" }
    confirmed_at { Date.today }
    admin false
  end

  factory :neighborhood do
    name { Faker::Address.community }
    city { Faker::Address.city }
    state { Faker::Address.state_abbr }
  end

  factory :land do
    address { Faker::Address.street_address }
    neighborhood
    why_we_like_it { Faker::Lorem.paragraph }
  end
end
