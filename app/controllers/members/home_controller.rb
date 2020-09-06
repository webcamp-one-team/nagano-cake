class Members::HomeController < ApplicationController
	before_action :set_genres

  def top
    @items = Item.all
  end

  def about
  end

  private
  def set_genres
  	@genres = Genre.all
  end

end
