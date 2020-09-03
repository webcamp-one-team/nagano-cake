class Item < ApplicationRecord
	belongs_to :genre
	attachment :img
end
