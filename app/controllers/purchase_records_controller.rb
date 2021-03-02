class PurchaseRecordsController < ApplicationController
  def index
    @item =Item.find(params[:item_id])
    @purchaserecord_destination = PurchaseRecordDestination.new
  end
  def create
    @item =Item.find(params[:item_id])
    @purchaserecord_destination = PurchaseRecordDestination.new(purchaserecord_destination_params)
    if @purchaserecord_destination.valid?
       @purchaserecord_destination.save
       redirect_to root_path
    else
       render :index
    end
  end

  private

  def purchaserecord_destination_params
      params.require(:purchase_record_destination).permit(:postal_code,:prefecture_id,:municipality,:address,:building_name,:phone_number).merge(item_id: params[:item_id], user_id: current_user.id)
  end
end
