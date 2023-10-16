# already Generated promo code by admin
PromoCode.create(name: 'promo_code', code: '2FOR1', expiry_date: DateTime.now + 2.days)
DiscountCode.create(name: 'discount_code', code: 'SAVE5', expiry_date: DateTime.now + 2.days)

# Create order and items
data_file = File.read('data/orders.json')
parsed_data = JSON.parse(data_file)

parsed_data.dig('orders').each do |order|
	new_order = Order.new(order.slice('price').merge({status: Order.statuses['in_progress']}.with_indifferent_access))
	if new_order.save
		# this can be optimized by calling the another seed file and add methods here.
		order.dig('items').each do |item|
			new_order.items.create(item.slice('name', 'size', 'instructions'))
		end
		# Associate promotion codes
		if order.dig('promotion_codes').present?
			promo_code = PromoCode.find_by(code: order.dig('promotion_codes'))
			new_order.promo_orders.create(promo_code_id: promo_code.id) if promo_code.present?
		end
		# Associate Discount Code
		if order.dig('discount_codes').present?
			discount_code = DiscountCode.find_by(code: order.dig('discount_codes'))
			new_order.discount_orders.create(discount_code_id: discount_code.id) if discount_code.present?
		end
	end
end 