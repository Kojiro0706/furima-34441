class Item < ApplicationRecord
  has_one_attached :image
  has_one :purchase_record
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :shipment_day

  with_options presence: true do
    validates :image
    validates :item
    validates :description
    validates :price, format: { with: /\A[0-9]+\z/ },
                      numericality: { only_integer: true, greater_than: 299, less_than: 10_000_000 }
  end
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :shipment_day_id
  end
end
