class RecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create, :pay_item]
  def index
    if @item.record.present?
      redirect_to root_path
    end

    @record_address = RecordAddress.new
  end

  def create
    @record_address = RecordAddress.new(address_params)
     if @record_address.valid?
      pay_item
      @record_address.save
      redirect_to root_path
     else
      render :index
     end
  end

  private

  def address_params
    params.require(:record_address).permit(:zip_code, :urban_id, :city, :address, :building, :telephone_number, :item_id, :token).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: address_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
