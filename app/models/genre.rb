class Genre < ApplicationRecord

	scope :validity, -> {where(varidity: true)}

	has_many :items
end