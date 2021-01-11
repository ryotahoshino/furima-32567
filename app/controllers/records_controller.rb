class RecordsController < ApplicationController
  def index
    @record_address = RecordAddress.new
    @item = Item.find(params[:item_id])
  end

  def new
  end

  def create
    @record_address = RecordAddress.new(address_params)
     if @record_address.valid?
      @record_address.save
      redirect_to action: :index
     else
      render action: :new
     end
  end

  private

  def address_params
    params.require(:record_address).permit(:zip_code, :urban_id, :city, :address, :building, :telephone_number).merge(item_id: params[item_id], user_id: user.id)
  end
end
