require_relative "meals"

class Order 

	attr_accessor :price_order

	def initialize(client_infos, order, price)
		@client_infos = client_infos
		@order = order
		@price = price
	end

end
