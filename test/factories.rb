FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.unique.email }
    password { "password" }
    password_confirmation { "password" }
    confirmed_at { Date.today }
    admin false
    housing_option { "option" }
    state { Faker::Address.state_abbr }
    city { Faker::Address.city }
    preferred_bedroom { Faker::Number.number(1) }
    preferred_bathroom { Faker::Number.decimal(1) }
    move_in_time { "12-18 months" }
    budget { "350" }
    pre_approved_mortgage { true }
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
