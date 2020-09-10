
class Members::ItemsController < Members::Base
  before_action :set_genre

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

  def set_genre
  	@genres = Genre.all
  end

end
