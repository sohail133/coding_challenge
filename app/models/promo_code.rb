class PromoCode < ApplicationRecord
	has_many :promo_orders
	has_many :orders, through: :promo_orders
end
