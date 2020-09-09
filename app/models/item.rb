class Item < ApplicationRecord
	belongs_to :genre
	has_many :carts
	has_many :members, through: :carts
	has_many :order_items
	has_many :order, through: :order_items

	attachment :img
end
