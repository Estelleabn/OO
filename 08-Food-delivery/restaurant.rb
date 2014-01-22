require_relative "manager"
require_relative "order_list"
require_relative "employee"
require_relative "order"

class Restaurant

  def initialize(name, phone_number, nb_of_employees)
  	@name = name
  	@phone_number = phone_number
  	@nb_of_employees = nb_of_employees
  end

end


