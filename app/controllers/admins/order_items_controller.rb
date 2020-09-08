class Admins::OrderItemsController < Admins::Base
  def update
  end
end

def order_item_params
    params.require(:order_item).permit(:order_id, :item_id, :past_price, :amount, :making_status, :created_at, :updated_at)
end

