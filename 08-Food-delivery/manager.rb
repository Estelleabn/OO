require_relative "order_list"
require_relative "employee"
require_relative "order"

class Manager < Employee

	attr_reader :order, :order_list, :total_price

  def initialize(name, password, order_list)
    super(name, password)
    @order_list = order_list
  end

  def create_order(client_infos, order, price)
  	@client_infos = client_infos
  	@order = order
  	@price = price
    @order_list.add_to_prepare(Order.new(@client_infos, @order, @price))
  end

end
