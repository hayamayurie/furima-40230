class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @item =Item.find(params[:item_id])
    @order_from =OrderFrom.new
    if current_user == @item.user
       redirect_to root_path
    end
  end

  def create
    binding.pry
    @item = Item.find(params[:item_id])
    @order_from = OrderFrom.new(order_params)
    if @order_from.valid?
      @order_from.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private
  def order_params
    params.require(:order_from).permit(:postal_code, :prefecture_id, :city, :street, :building_name, :phone_number).merge(user_id: current_user.id,item_id: @item.id,token: params[:token])
  end
end