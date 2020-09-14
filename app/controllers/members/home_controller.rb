
class Members::HomeController < Members::Base
	before_action :set_genres
  before_action :set_items

  def top
      @item = Item.where(is_active: true)
      @all_ranks = Item.find(OrderItem.group(:item_id).order('count(item_id) desc').limit(3).pluck(:item_id))
  end

  def about
  end

  private
  def set_genres
  	@genres = Genre.where(validity: true)
  end

  def set_items
     @all_rankings = Item.find(Like.group(:item_id).order('count(item_id) desc').pluck(:item_id))
  end

end
