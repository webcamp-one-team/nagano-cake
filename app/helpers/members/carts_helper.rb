module Members::CartsHelper

  def tax(price)
    "#{ (price*1.1).floor }"
  end

end
