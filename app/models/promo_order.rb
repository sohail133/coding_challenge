class PromoOrder < ApplicationRecord
	belongs_to :promo_code
	belongs_to :order
end

