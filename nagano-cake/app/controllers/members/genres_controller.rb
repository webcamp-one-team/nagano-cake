
class Members::GenresController < Members::Base

  def show
  	@genre = Genre.find(params[:id])
  	@genres = Genre.where(validity: true)
  	@items = @genre.items
  end

  private
  def genre_params
    params.require(:genre).permit(:name, :validity)
  end
end
