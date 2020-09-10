class Admins::TopsController < Admins::Base
  def top
    @order_item = OrderItem.where("created_at >= ?", Date.today)
  end


end
