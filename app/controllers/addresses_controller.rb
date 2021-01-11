class AddressesController < ApplicationController
  def index
  end

  def new
    @user_address = UserAddress.new
  end

  def create
    @user_address = UserAddress.new(address_params)
     if @user_address.valid?
      @user_address.save
      redirect_to action: :index
     else
      render action: :new
     end
  end

  private

  def address_params
    params.require(:user_address).permit(:nickname, :zip_code, :urban_id, :city, :address, :building, :telephone_number).merge(record_id: record.id)
  end

  def record_params
    params.merge(item_id: item.id, user_id: user.id)
  end
end
