class Members::LikesController < Members::Base
	def create
		item = Item.find(params[:item_id])
		like = current_member.likes.new(item_id: item.id)
		like.save
		redirect_to item_path(item)
	end

	def destroy
		item = Item.find(params[:item_id])
		like = current_member.likes.find_by(item_id: item.id)
		like.destroy
		redirect_to item_path(item)
	end
end
