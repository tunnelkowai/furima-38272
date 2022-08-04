FactoryBot.define do
  factory :order_address do
    token { "tok_abcdefghijk00000000000000000" }
    post_code { "#{Faker::Number.number(digits: 3)}-#{Faker::Number.number(digits: 4)}" }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    municipalities { Faker::Address.city }
    address { Faker::Address.building_number }
    building { Faker::Address.street_name }
    phone_number { Faker::Number.number(digits: 10) }
  end
end
