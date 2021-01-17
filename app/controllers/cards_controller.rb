class CardsController < ApplicationController
  def new
  end

  def create
    Payjp.api_key = ENV["PAYJS_SECRET_KEY"]
    customer = Payjs::Customer.create(
      descriotion: 'test',
      card: params[:card_token]
    )
    card = Card.new(
      card_token: params[:card_token],
      customer_token: customer.id,
      user_id: current_user.id
    )
    if card.save
      redirect_to root_path
    else
      render "new"
    end
  end
end
