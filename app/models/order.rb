class Order < ApplicationRecord

	belongs_to :member
	has_many :order_items
	has_many :items, through: :order_items

	enum payment_method: [:クレジットカード, :銀行振込 ]

	enum order_status: [:入金待ち, :入金確認, :製作中, :発送準備中, :発送済]

end
