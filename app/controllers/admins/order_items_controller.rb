class Admins::OrderItemsController < Admins::Base
  def update
  	@order_item = OrderItem.find(params[:id])
  	@order = @order_item.order
    @order_item.update(order_item_params)
    if @order_item.making_status == "製作中" #製作ステータスが「製作中」なら入る
       @order.update(order_status: 2) #注文ステータスを「製作中」　に更新
    	#上記の条件に当てはまらなければ、商品の個数の特定 製作ステータスが「製作完了」の商品をカウント
		#数が一致すれば、全ての商品の製作ステータスが「製作完了」だとわかる
	elsif @order.order_items.count ==  @order.order_items.where(making_status: "製作完了").count
		@order.update(order_status: 3) #注文ステータスを「発送準備中]に更新
	end
  	redirect_to admins_order_path(@order)
  end
end

def order_item_params
    params.require(:order_item).permit(:order_id, :item_id, :past_price, :amount, :making_status, :created_at, :updated_at)
end

