FactoryBot.define do
  factory :user do
    nickname { 'イチロー' }
    last_name { '鈴木' }
    first_name { '一郎' }
    kana_last_name { 'スズキ' }
    kana_first_name { 'イチロウ' }
    birthday { '1973-10-22' }
    email { Faker::Internet.free_email }
    password { '123abc' }
    password_confirmation { password }
  end
end
