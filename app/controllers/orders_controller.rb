class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end
  
  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
      if @order_address.valid?
        @order_address.save
        redirect_to root_path
      else
        render :index
      end
  end

  private

  def order_params
    params.require(:order_address).permit(:post_code, :prefecture_id, :municipalities, :address, :building, :phone_number).merge(user: current_user.id, item: @item.id)
  end

end
