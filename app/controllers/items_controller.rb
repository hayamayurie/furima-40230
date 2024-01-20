class ItemsController < ApplicationController
  def index
  end
  def new
    @item = Item.new(image_params)
  end
end

private
def image_params
  params.require(:item).permit(:name, :explanation, :category_id, :condition_id, :postage_type_id, :prefecture_id, :preparation_day_id, :price , :image ).merge(user_id: current_user.id)
end

