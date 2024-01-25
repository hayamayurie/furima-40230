class OrdersController < ApplicationController

  def index
    @order =Order.new
  end

  def create
    @order=Order.create(order_params)
    @order.save
  end

  private
  def order_params
    params.require(:order_from).permit(:postal_code, :prefecture_id, :city, :street, :building_name, :phone_number,:order_id,:item_id,:user_id).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end

