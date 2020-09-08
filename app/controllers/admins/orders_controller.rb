class Admins::OrdersController < Admins::Base
  def index
  	@orders = Order.all
  	@order_items = OrderItem.all
  end

  def show
  	@order = Order.find(params[:id])
  end

  def update
  end

  private
  def orders_params
    params.require(:order).permit(:member_id,:payment_method, :order_status, :postal_code, :address, :name, :deliver_charge, :total_payment, order_items_attributes: [:order_id, :item_id, :amount, :past_price, :making_status])
  end
end
