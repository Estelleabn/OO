class OrangeTree 
  
  def initialize
    @age = 0
    @height = 0
    @orange_count = 0
    @dead = false
  end
  
  def measure_height
    puts @dead ? "Your tree's dead" : "#{@height} cm"
  end
  
  def count_the_oranges
    puts @dead ? "A dead tree has no oranges.." : "#{@orange_count} oranges"
  end
  
  def pick_an_orange!
    if @dead == true
      puts "A dead tree has nothing to offer.."
    else 
      @orange_count -= 1 
      puts "You pick a delicious juicy orange"
    end
  end

  def any_fruit
    if @orange_count == 0
      puts "There is no orange here"
    end
  end
  
  def one_year_passes!
    if @dead == true
      puts "A year later, the tree is still dead.."
    else
    @age += 1
      if @age > 27 
        @dead = true
        puts "Oh, no! The tree is too old, and has died.."
      else
        @height += 33
        @orange_count += 8
        any_fruit
        return "This year your tree grew to #{@height} cm tall, and has #{@orange_count} oranges"
      end  
    end
  end
end

orange_tree = OrangeTree.new
23.times { orange_tree.one_year_passes! }
puts(orange_tree.one_year_passes!)
# => This year your tree grew to 9.6 m tall, and produced 119 oranges
puts(orange_tree.count_the_oranges)
# => 119 oranges
puts(orange_tree.pick_an_orange!)
# => You pick a delicious juicy orange
puts(orange_tree.count_the_oranges)
# => 118 oranges
puts(orange_tree.measure_height)
# => 9.6 m
puts(orange_tree.one_year_passes!)
# => This year your tree grew to 10.0 m tall, and produced 125 oranges
puts(orange_tree.one_year_passes!)
# => This year your tree grew to 10.4 m tall, and produced 131 oranges
puts(orange_tree.one_year_passes!)
# => Oh, no! The tree is too old, and has died..
puts(orange_tree.one_year_passes!)
# => A year later, the tree is still dead..
puts(orange_tree.count_the_oranges)
# => A dead tree has no oranges..
puts(orange_tree.pick_an_orange!)
# => A dead tree has nothing to offer..