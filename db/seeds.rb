# Create order and items
data_file = File.read('data/orders.json')
parsed_data = JSON.parse(data_file)

parsed_data.dig('orders').each do |order|
	new_order = Order.new(order.slice('price').merge({status: Order.statuses['in_progress']}.with_indifferent_access))
	if new_order.save
		binding.pry
	end
end 