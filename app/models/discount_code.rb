class DiscountCode < ApplicationRecord
	has_many :discount_orders
	has_many :orders, through: :discount_orders
end
