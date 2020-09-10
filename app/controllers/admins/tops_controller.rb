class Admins::TopsController < Admins::Base
  def top
    @today_order = Order.where(created_at: Date.today.all_day)
  end

end
