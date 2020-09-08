
class Members::CartsController < Members::Base
   before_action :authenticate_member!
   before_action :set_member
  # # before_action :set_cart

  def create
    @cart = current_member.carts.build(cart_params)
    @current_item = Cart.find_by(item_id: @cart.item_id,member_id: @cart.member_id)
    if @current_item.nil?
      if @cart.save
        flash[:success] = 'カートに商品が追加されました！'
        redirect_to carts_path
      else
        @carts = @member.carts.all
        render 'index'
        flash[:danger] = 'カートに商品を追加できませんでした。'
      end
    else
      @current_item.amount += params[:amount].to_i
      @current_item.update(cart_params)
      redirect_to carts_path
    end
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
  
  def destroy_all
  end


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

  
 

  

 
 

  