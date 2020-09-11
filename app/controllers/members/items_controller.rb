
class Members::ItemsController < Members::Base
  before_action :set_genres

  def index
  	@items = Item.includes(:genre).where(genres:{validity: true}).is_active
  end

  def show
  	@item = Item.find(params[:id])
  	@cart = @item.carts.build
  end


  private
  def item_params
    params.require(:item).permit(:name, :detail, :img, :price, :genre_id, :is_active)
  end

  def set_genres
  	@genres = Genre.where(validity: true)
  end

end
