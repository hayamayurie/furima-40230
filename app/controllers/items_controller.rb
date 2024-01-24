class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_items, only: [:show, :edit, :update, :destroy]
  before_action :check_item_owner, only: [:edit]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def destroy
    return unless @item.user == current_user

    @item.destroy
    redirect_to root_path
  end

  def update
    if @item.update(items_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def items_params
    params.require(:item).permit(:name, :explanation, :category_id, :condition_id, :postage_type_id, :prefecture_id,
                                 :preparation_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_items
    @item = Item.find(params[:id])
  end

  def check_item_owner
    redirect_to root_path unless @item.user == current_user
  end
end
