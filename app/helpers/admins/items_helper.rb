module Admins::ItemsHelper
  def tax(price)
    "#{ (price*1.1).floor }"
  end

end