
class Members::ItemsController < Members::Base
  before_action :set_genres

  def index
    #キーワードが入力されていれば、whereメソッドとLIKE検索（部分一致検索）を組み合わせて、必要な情報のみ取得する。
      @genres = Genre.where(validity: true)
      @items = Item.where(genre_id: @genres.pluck(:id)).where(is_active: true)
      @items = @items.where('name LIKE ?', "%#{params[:search]}%") if params[:search].present?
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
