class Members::GenresController < ApplicationController
  def show
  	@genre = Genre.find(params[:id])
  	@items = genre.item.id
  	@genres = Genre.all
  end
end
