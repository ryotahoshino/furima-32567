class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  def edit
  end

  def update
    if curent_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :detail, :price, :user, :state_id, :burden_id, :origin_id, :day_id, :category_id).merge(user_id: current_user.id)
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end
end