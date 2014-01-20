class Dessert
  attr_accessor :flavor, :name, :calories
  def initialize(name, calories)
    @name = name
    @calories = calories
  end

  def healthy?
    @calories < 200 ? true : false
  end

  def delicious?
    @flavor == "black licorice" ? false : true
  end
end

class JellyBean < Dessert
  def initialize(name, calories, flavor)
    super(name, calories)
    @flavor = flavor
  end

  def healthy?
    super
  end

  def delicious?
   super
  end

end

new_dessert = Dessert.new("Cheesecake", 390)
puts new_dessert.healthy?

my_jellybean = JellyBean.new("JellyBean", 90, "black licorice")
puts my_jellybean.delicious?
puts new_dessert.delicious?

my_favorite_jellybean = JellyBean.new("JellyBean", 90, "strawberry")
puts my_favorite_jellybean.delicious?
puts my_favorite_jellybean.healthy?