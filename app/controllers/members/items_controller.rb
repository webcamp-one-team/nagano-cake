class Members::ItemsController < Members::ApplicationController
	

  def index
  	@items = Item.all
  	@genres = Genre.all

  end

  def show
  	@item = Item.find(params[:id])
  end

  private
  

end
