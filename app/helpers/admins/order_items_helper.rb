module Admins::OrderItemsHelper
  def tax(price)
    "#{ (price*1.1).floor }"
  end
end
