require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#商品出品登録' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '出品情報の登録が上手くいきとき' do
      it '全ての情報が適切に入力されていれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '出品情報の登録がうまくいかないとき' do
      it '商品画像が空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空だと登録できない' do
        @item.item = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item can't be blank")
      end
      it '商品の説明が空だと登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'カテゴリーがID:1だと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it '商品の状態がID:1だと登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition must be other than 1')
      end
      it '配送料の負担がID:1だと登録できない' do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery fee must be other than 1')
      end
      it '発送元の地域がID:1だと登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it '発送までの日数がID:1だと登録できない' do
        @item.shipment_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipment day must be other than 1')
      end
      it '商品価格が空だと登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '商品価格が半角数字ではないと登録できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it '商品価格が300円未満だと登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than 299')
      end
      it '商品価格が10000000円以上だと登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than 10000000')
      end
      it 'ユーザーが紐付いていないと保存できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
