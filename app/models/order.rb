class Order < ApplicationRecord
	has_many :items, dependent: :destroy

	has_many :promo_orders
	has_many :promo_codes, through: :promo_orders

	has_many :discount_orders
	has_many :discount_codes, through: :discount_orders

	enum status: [:in_progress, :completed]
end
