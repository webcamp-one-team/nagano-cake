class Item < ApplicationRecord
	belongs_to :genre
	has_many :order_items
	attachment :img
end
