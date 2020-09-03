class Members::HomeController < ApplicationController
	
  def top
  	@genres = Genre.all
  	@items = Item.all
  end

  def about
  end

  private

  

end
