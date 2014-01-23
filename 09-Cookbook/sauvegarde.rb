require 'nokogiri'
require 'csv'

doc = Nokogiri::HTML(File.open('marmiton.html'))

good = doc.search('.m_search_result').each do |element|
    puts "#{element.search('.m_search_titre_recette > a').inner_text}"
    puts "Rating : #{element.search('.etoile1').size} / 5}"
    puts "#{element.search('.m_search_result_part4').inner_text.split[0...4].join(' ').match(/\d./)} min \n" #Temps de preparation
    puts "#{element.search('.m_search_result_part4').inner_text.split[4...8].join(' ').match(/\d./)} min \n" #Temps de cuisson 
end

puts good

# my_favorite_recipes = File.path("c:/Users/EstelleAbn/Documents/GitHub/Wagon/OO/09-Cookbook/recipes.csv")
# puts my_favorite_recipes

selected_recipes = []

CSV.foreach(File.path("c:/Users/EstelleAbn/Documents/GitHub/Wagon/OO/09-Cookbook/recipes.csv")) do |col|
	  selected_recipes << col
  end

puts selected_recipes