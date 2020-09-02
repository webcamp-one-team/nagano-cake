class Admins::ItemsController < ApplicationController
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

  def set_genre
    @genres = Genre.all
  end

  private
  def item_params
    params.require(:item).permit(:name, :detail, :image, :price, :genre_id)
  end

  def set_genres
      @genres = Genre.all
  end
end
