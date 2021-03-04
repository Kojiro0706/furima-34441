class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :check_user, only: [:index,:create]
  def index
    redirect_to root_path if @item.purchase_record.present?
    @purchaserecord_destination = PurchaseRecordDestination.new
  end

  def create
    @purchaserecord_destination = PurchaseRecordDestination.new(purchaserecord_destination_params)
    if @purchaserecord_destination.valid?
      pay_item
      @purchaserecord_destination.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchaserecord_destination_params
    params.require(:purchase_record_destination).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number).merge(
      item_id: params[:item_id], user_id: current_user.id, token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchaserecord_destination_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def check_user
    redirect_to root_path if @item.user_id == current_user.id
  end
end
