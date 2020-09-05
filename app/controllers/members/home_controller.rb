class Members::HomeController < Members::Base
	
  def top
  	@genres = Genre.all
  	@items = Item.all
  end

  def about
  end

  private

  

end
