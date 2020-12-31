class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private

  def item_params
    params.require(:item).permit(:name, :detail, :price, :user, :state_id, :burden_id, :origin_id, :day_id, :category_id)
  end
end