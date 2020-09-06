class Members::CartsController < ApplicationController
   before_action :authenticate_member!
   before_action :set_member
  # # before_action :set_cart


   def create
   	@cart = Cart.new(cart_params)
   	@item = Cart.find_by(item_id: @cart.item_id, member_id: @cart.member_id)
   	@cart.member_id = current_member.id
   	@cart.save
   	redirect_to carts_path
   end

   def index
  	@carts = @member.carts.all
   end

   def update
   	@cart = Cart.find(params[:id])
   	@cart.update(cart_params)
   	redirect_to carts_path
   end

  # # def destoroy
  # # 		@cart = Cart.find(params[:id])
  # # 		@cart.destroy
  # # 		redirect_to carts_path
  # # end


  private

  def cart_params
   	params.require(:cart).permit(:member_id, :item_id, :amount)
  end

  def set_member
   	@member = current_member
  end

  # def set_cart
  # 	@cart = Cart.find(params[:id])
  # end
end
