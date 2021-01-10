class AddressesController < ApplicationController
  def index
  end

  def new
  end

  def create
    user = User.create(user_params)
    Address.create(address_params(user))
    Record.create(record_params(user))
    redirect_to action: :index
  end

  private

  def user_params
    params.permit(:nickname)
  end

  def address_params
    params.permit(:zip_code, :urban_id, :city, :address, :building, :telephone_number).merge(record_id: record.id)
  end

  def record_params
    params.merge(item_id: item.id, user_id: user.id)
  end
end
