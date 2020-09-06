class Members::OrdersController < ApplicationController

  before_action :set_member
  def new
  	@order = Order.new
  end

  def create
     if current_member.carts.exists?
       @order = Order.new(orders_params)
       @order.member_id = current_member.id

       @add = params[:order][:add].to_i
       case @add
       when 1
         @order.postal_code = @member.postal_code
         @order.address = @member.address
         @order.name = @member.last_name && @member.first_name
       when 2
         @order.postal_code = params[:order][:postal_code]
         @order.address = prams[:order][:address]
         @order.name = params[:order][:name]
       when 3
         @order.postal_code = params[:order][:postal_code]
         @order.address = params[:order][:address]
         @order.name = params[:order][:name]
       end
        @order.save

       if Address.find_by(address: @order.address).nil?
         @address = Address.new
         @address.postal_code = @order.postal_code
         @address.address = @order.address
         @address.name = @order.name
         @address.member_id = current_member.id
         @address.save
       end

       current_member.carts.each do |cart|
         order_item = @order.order_items.build
         order_item.order_id = @order.id
         order_item.item_id = cart.item_id
         order_item.amount = cart.amount
         order_item.past_price = cart.item.price
         order_item.save
         cart.destroy
       end
         render :thanks
     else
       redirect_to member_top_path
     end
  end



  def confirm
    @order = Order.new(orders_params)
    @carts = current_member.carts
    @order.payment_method = params[:order][:payment_method]
    @add = params[:order][:add].to_i
    case @add

    when 1
      @order.postal_code = @member.postal_code
      @order.address = @member.address
      @order.name = @member.last_name
    when 2
      @sta = params[:order][:address].to_i
      @address = Address.find(@sta)
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    when 3
      @order.postal_code = params[:order][:new_add][:postal_code]
      @order.address = params[:order][:new_add][:address]
      @order.name = params[:order][:new_add][:name]
    end
  end

  def thanks
  end

  def index
    @orders = @member.orders
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def orders_params
  	params.require(:order).permit(:member_id,:payment_method, :order_status, :postal_code, :address, :name, :deliver_charge, :total_payment, order_items_attributes: [:order_id, :item_id, :amount, :past_price, :making_status])
  end

  def set_member
    @member = current_member
  end

end
