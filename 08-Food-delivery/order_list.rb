require_relative "employee"
require_relative "order"
require_relative "manager"

class OrderList

	attr_reader :order
	attr_accessor :next_to_prepare, :next_to_deliver

  def initialize
    @next_to_prepare = []
    @next_to_deliver = []
  end

  def add_to_prepare(order)
  	@order = order
  	@next_to_prepare << @order
  end

  def to_s
  	"********** \nOrders to prepare: \n#{@next_to_prepare} \nOrders to deliver: \n#{@next_to_deliver} \n**********"
  end

end