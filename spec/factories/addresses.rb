FactoryBot.define do
  factory :address do
    postal_code { "MyString" }
    city { "MyString" }
    address { "MyString" }
    building { "MyString" }
    phone_number { "MyString" }
    purchase { nil }
    prefecture_id { 1 }
  end
end
