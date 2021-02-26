FactoryBot.define do
  factory :item do
    item { 'アイウエオ' }
    description { 'カキクケコサシスセソ' }
    category_id { 2 }
    condition_id { 2 }
    delivery_fee_id { 2 }
    prefecture_id { 2 }
    shipment_day_id { 2 }
    price { 300 }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test1.png'), filename: 'test1.png')
    end
  end
end
