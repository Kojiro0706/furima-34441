class PurchaseRecordDestination
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :municipality
    validates :address
    validates :phone_number, format: { with:/\A\d{11}\z/}
    validates :item_id
    validates :user_id
    validates :token
  end

  def save
    purchaserecord = PurchaseRecord.create(item_id: item_id, user_id: user_id)
    Destination.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address,
                       building_name: building_name, phone_number: phone_number, purchase_record_id: purchaserecord.id)
  end
end
