class DiscountOrder < ApplicationRecord
	belongs_to :discount_code
	belongs_to :order
end
