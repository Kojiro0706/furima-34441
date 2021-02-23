class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    VARID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/
    validates :last_name, format: { with: VARID_NAME_REGEX }
    validates :first_name, format: { with: VARID_NAME_REGEX }
    VARID_KANA_NAME_REGEX = /\A[ァ-ヶー－]+\z/
    validates :kana_last_name, format: { with: VARID_KANA_NAME_REGEX }
    validates :kana_first_name, format: { with: VARID_KANA_NAME_REGEX }
    validates :birthday
    VALID_PASSWORD_REGEX = /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]{6,}\z/
    validates :password, format: { with: VALID_PASSWORD_REGEX }
  end
end