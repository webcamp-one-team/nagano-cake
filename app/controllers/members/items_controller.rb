class Members::ItemsController < ApplicationController

  def index
  	@items = Item.all
  end

  def show
  	@item = Item.find(params[:id])
  	@cart = @item.carts.build
  end

  
  private
  def item_params
  	params.require(:item).permit(:name, :detail, :img, :price, :genre_id, :is_active)
  end
end