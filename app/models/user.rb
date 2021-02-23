class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
      validates :nickname
      validates :birthday
      validates :password, format: { with: /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]{6,}\z/ }

    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ } do
      validates :last_name
      validates :first_name
    end

    with_options format: { with: /\A[ァ-ヶー－]+\z/ } do
      validates :kana_last_name
      validates :kana_first_name
    end
  end
end