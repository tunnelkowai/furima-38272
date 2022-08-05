class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_params, only: [:index, :create, :move_to_index]
  before_action :move_to_index

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
      if @order_address.valid?
        pay_item
        @order_address.save
        redirect_to root_path
      else
        render :index
      end
  end

  private

  def order_params
    params.require(:order_address).permit(:post_code, :prefecture_id, :municipalities, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def find_params
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to controller: :items, action: :index if current_user.id == @item.user.id || @item.order.present?
  end

end

