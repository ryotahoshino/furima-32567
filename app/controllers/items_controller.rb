class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_item, only: [:edit, :show]

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
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

  def show
  end

  private

  def item_params
    params.require(:item).permit(:name, :detail, :image, :price, :user, :state_id, :burden_id, :origin_id, :day_id, :category_id).merge(user_id: current_user.id)
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end