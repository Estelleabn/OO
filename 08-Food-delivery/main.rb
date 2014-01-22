require_relative "manager"
require_relative "order_list"
require_relative "employee"
require_relative "order"
require_relative "cook"
require_relative "restaurant"
require_relative "delivery_boy"


#test

fatance = Restaurant.new("Au pays de la Fatance", "0139782178", 5)
fatance_list = OrderList.new
fatance_menu = Meals.new

aurelie_client = {name: "Aurelie Lebon", address: "34 rue du Louvre"}

jean_luc = Manager.new("Jean-Luc Borderline", "kikoolol123", fatance_list)
jean_luc.create_order(aurelie_client, :pizza, 10)
puts fatance_list
puts fatance_list.next_to_prepare.inspect

gerard = Cook.new("Gerard Munich", "kikoolol143", fatance_list)
gerard.prepare_orders
p fatance_list.next_to_prepare
p fatance_list.next_to_deliver

brian = DeliveryBoy.new("Brian Pouchard", "pouchytuning", fatance_list)
brian.deliver_orders
p fatance_list.next_to_deliver