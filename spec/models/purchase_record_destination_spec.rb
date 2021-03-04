require 'rails_helper'

RSpec.describe PurchaseRecordDestination, type: :model do
  describe '購入商品情報の保存' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @purchaserecord_destination = FactoryBot.build(:purchase_record_destination, user_id: @user.id, item_id: @item.id)
      sleep 0.1
    end
    context '購入商品情報が保存できる' do
      it '全ての情報がある場合登録できる' do
        expect(@purchaserecord_destination).to be_valid
      end
      it '建物名が空の場合でも登録できる' do
        @purchaserecord_destination.building_name = ''
        expect(@purchaserecord_destination).to be_valid
      end
    end
    context '購入商品が保存できない場合' do
      it 'postal_codeが空だと保存できない' do
        @purchaserecord_destination.postal_code = ''
        @purchaserecord_destination.valid?
        expect(@purchaserecord_destination.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できない' do
        @purchaserecord_destination.postal_code = '1234567'
        @purchaserecord_destination.valid?
        expect(@purchaserecord_destination.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'prefecture_idが1だと保存できない' do
        @purchaserecord_destination.prefecture_id = 1
        @purchaserecord_destination.valid?
        expect(@purchaserecord_destination.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'municipalityが空だと登録できない' do
        @purchaserecord_destination.municipality = ''
        @purchaserecord_destination.valid?
        expect(@purchaserecord_destination.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressが空だと登録できない' do
        @purchaserecord_destination.address = ''
        @purchaserecord_destination.valid?
        expect(@purchaserecord_destination.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと登録できない' do
        @purchaserecord_destination.phone_number = ''
        @purchaserecord_destination.valid?
        expect(@purchaserecord_destination.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが12けた以上だと登録できない' do
        @purchaserecord_destination.phone_number = '080123456789'
        @purchaserecord_destination.valid?
        expect(@purchaserecord_destination.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが数字以外が混合していると登録できない' do
        @purchaserecord_destination.phone_number = 'aiueo123456'
        @purchaserecord_destination.valid?
        expect(@purchaserecord_destination.errors.full_messages).to include('Phone number is invalid')
      end
      it 'userと紐づいてないと登録できない' do
        @purchaserecord_destination.user_id = nil
        @purchaserecord_destination.valid?
        expect(@purchaserecord_destination.errors.full_messages).to include("User can't be blank")
      end
      it 'itemと紐づいていないと登録できない' do
        @purchaserecord_destination.item_id = nil
        @purchaserecord_destination.valid?
        expect(@purchaserecord_destination.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空では登録できない' do
        @purchaserecord_destination.token = nil
        @purchaserecord_destination.valid?
        expect(@purchaserecord_destination.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
