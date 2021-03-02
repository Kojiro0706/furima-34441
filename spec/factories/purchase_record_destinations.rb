FactoryBot.define do
  factory :purchase_record_destination do
    postal_code{'123-4567'}
    prefecture_id{2}
    municipality{'港区'}
    address{'白金台1-1-1'}
    building_name{'白金タワー'}
    phone_number{'08012345678'}
  end
end
