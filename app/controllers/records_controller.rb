class RecordsController < ApplicationController
  def index
  end

  def new
    @record_address = RecordAddress.new
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
    params.require(:record_address).permit(:zip_code, :urban_id, :city, :address, :building, :telephone_number).merge(item_id: item.id, user_id: user.id)
  end
end
