
class Members::HomeController < Members::Base
	before_action :set_genres
  before_action :set_items

  def top
  end

  def about
  end

  private
  def set_genres
  	@genres = Genre.all
  end

  def set_items
     @items = Item.all
  end

end
