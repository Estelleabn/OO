require_relative "order_list"
require_relative "employee"
require_relative "order"

class DeliveryBoy < Employee

	attr_reader :order, :order_list

  def initialize(name, password, order_list)
    super(name, password)
    @order_list = order_list
  end

  def deliver_orders
    @order_list.next_to_deliver= []
  	"Yahoo, all the orders have been delivered by #{@name}"
  end

end