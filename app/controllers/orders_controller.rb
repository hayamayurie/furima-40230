class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_items, only: [:index, :create]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_from =OrderFrom.new
    redirect_to root_path and return if current_user == @item.user || @item.order.present?
  end

  def create
    @order_from = OrderFrom.new(order_params)
    if @order_from.valid?
      pay_item
      @order_from.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private
  def order_params
    params.require(:order_from).permit(:postal_code, :prefecture_id, :city, :street, :building_name, :phone_number).merge(user_id: current_user.id,item_id: @item.id, token: params[:token])
  end

  def set_items
    @item = Item.find(params[:item_id])
  end

  def  pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end