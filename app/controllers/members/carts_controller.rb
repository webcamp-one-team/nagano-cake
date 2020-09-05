class Members::CartsController < ApplicationController

  def index
    @carts = Cart.all
  end

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

  def update
  end

  def destroy
  end

  def destroy_all
  end

  private
  def cart_params
  	params.require(:cart).permit(:member_id, :item_id, :amount)
  end

end