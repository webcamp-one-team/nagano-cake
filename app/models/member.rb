class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def active_for_authentication?
    super && (self.is_deleted == false)
  end

  has_many :addresses
  has_many :carts
  has_many :orders
  has_many :cart_items
  has_many :items, through: :cart_items
  has_many :likes, dependent: :destroy


end

