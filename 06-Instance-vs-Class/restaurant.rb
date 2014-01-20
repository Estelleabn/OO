

class Restaurant
  	@total_ratings = 0
    attr_reader :rating
	
	class << self
		attr_accessor :total_ratings
	end

	def self.global_ratings
	  "#{@total_ratings} restaurants were rated by our app. SWEET!"
    end

    def self.add_global_ratings
	  @total_ratings += 1
    end
  
  def initialize(name, address, type_of_food)
  	@name = name
  	@address = address
  	@rating = []
  	@type_of_food = type_of_food
  	@ambiancy = []
  end

  def rate(rating)
  	if rating <= 5
  	@rating << rating
  	Restaurant.add_global_ratings
  else
  	puts "You can only rate between 0 and 5"
  end
  end

  def avg_rating
  	@avg_rating = ( (@rating.inject(:+).to_f) / @rating.length ).round(1)
  end

  def add_ambiancy(ambiancy)
    @ambiancy << ambiancy
  end

  def to_s
  	"The Restaurant #{@name}, #{@address}, has an average rate of #{@avg_rating} / 5"
  end

end

bec_fin = Restaurant.new("Le Bec Fin", "12 rue Saint Georges, 78400 Chatou", :bistrot)
bec_fin.rate(2)
bec_fin.rate(3)
bec_fin.rate(6)
bec_fin.avg_rating
puts bec_fin
bec_fin.add_ambiancy(:sympa)
puts Restaurant.global_ratings
puts Restaurant.total_ratings
