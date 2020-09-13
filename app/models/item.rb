class Item < ApplicationRecord

	scope :is_active, -> { where(is_active: true)}

	belongs_to :genre
	has_many :carts
	has_many :members, through: :carts
	has_many :order_items
	has_many :order, through: :order_items
	has_many :likes, dependent: :destroy

	def liked_by?(member)
		likes.where(member_id: member.id).exists?
	end

	attachment :img
end
