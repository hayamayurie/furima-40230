class ItemsController < ApplicationController
  
  def index
  end

  def new
    @item = Item.new(image_params)
  end
end

private
def image_params
end

