require_relative "order_list"
require_relative "employee"
require_relative "order"

class Cook < Employee

	attr_reader :order, :order_list, :total_price

  def initialize(name, password, order_list)
    super(name, password)
    @order_list = order_list
  end

  def prepare_orders
    @order_list.next_to_prepare.each do |order_pending|
      @order_list.next_to_deliver << order_pending
    end
    @order_list.next_to_prepare = []
  end

end