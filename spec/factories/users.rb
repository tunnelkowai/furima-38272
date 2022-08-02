FactoryBot.define do
  factory :user do
    nick_name { Faker::Name.name }
    email { Faker::Internet.free_email }
    password { Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation { password }
    last_name { 'てすと' }
    first_name { 'てすと' }
    last_name_kana { 'テスト' }
    first_name_kana { 'テスト' }
    birthday { Faker::Date.between(from: '1930-01-01', to: 5.year.ago) }
  end
end
