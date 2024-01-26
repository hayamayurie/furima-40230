class OrdersController < ApplicationController

  def index
    @item =Item.find(params[:item_id])
    @order_from =OrderFrom.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_from = OrderFrom.new(order_params)
    if @order_from.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:order_from).permit(:postal_code, :prefecture_id, :city, :street, :building_name, :phone_number).merge(user_id: current_user.id,item_id: @item.id)
  end
end