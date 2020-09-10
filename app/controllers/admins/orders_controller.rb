class Admins::OrdersController < Admins::Base
  before_action :set_order_item, only: [:update]

  def index
    @orders = Order.all
    @order_items = OrderItem.all
  end

  def show
    @order = Order.find(params[:id])
    @order_item = OrderItem.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(orders_params)
    #注文ステータスが入金確認なら下の事をする
    if @order.order_status == "入金確認"
    #製作ステータスを「製作待ちに」更新
      @order.order_items.update(making_status: 1)
    end
    redirect_to admins_order_path(@order)
  end

  private
  def orders_params
    params.require(:order).permit(:member_id, :payment_method, :order_status, :postal_code, :address, :name, :deliver_charge, :total_payment, order_items_attributes: [:order_id, :item_id, :amount, :past_price, :making_status])
  end

  def set_order_item
      @order_item = OrderItem.find(params[:id])
  end
end
