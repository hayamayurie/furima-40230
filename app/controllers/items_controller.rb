class ItemsController < ApplicationController
  before_action :authenticate_user!, only:[:new, ]
  
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.all(image_params)
    if @item.save
      redirect_to '/'
    else
      render :new, status: :unprocessable_entity
    end
  end
end

private
def image_params
  params.require(:item).permit(:name, :explanation, :category_id, :condition_id, :postage_type_id, :prefecture_id, :preparation_day_id, :price , :image ).merge(user_id: current_user.id)
end

