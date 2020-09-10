class Order < ApplicationRecord

	belongs_to :member
	has_many :order_items
	has_many :items, through: :order_items

	enum payment_method: [:クレジットカード, :銀行振込 ]
	enum order_status: { 入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4 }

end
