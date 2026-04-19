FactoryBot.define do
  factory :user do
    nickname              { "test" }
    email                 { Faker::Internet.email }
    password              { "abc123" }
    password_confirmation { password }
    last_name             { "矢動丸" }
    first_name            { "翔" }
    last_name_kana        { "ヤドウマル" }
    first_name_kana       { "ショウ" }
    birthday              { "2001-05-21" }
  end
end