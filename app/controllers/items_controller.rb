class ItemsController < ApplicationController
  before_action :authenticate_user!, only:[:new, ]
  
  def index
  end

  def new
    @item=Item.new
  end

  def create
    @item = Item.create(items_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

private

  def items_params
    params.require(:item).permit(:name, :explanation, :category_id, :condition_id, :postage_type_id, :prefecture_id, :preparation_day_id, :price, :image ).merge(user_id: current_user.id)
  end
end