class Admins::ItemsController < Admins::ApplicationController
  before_action :set_genres, only: [:index, :new, :edit, :create, :update]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admins_items_path(@item.id)
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admins_item_path(@item)
  end

  private
  def item_params
    params.require(:item).permit(:name, :detail, :img, :price, :genre_id, :is_active)
  end

  def set_genres
      @genres = Genre.all
  end
end
