require 'open-uri'

puts "Creating ingredients"

Ingredient.destroy_all

count = 0
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_serialized = open(url).read
ingredients = JSON.parse(ingredients_serialized)
ingredients["drinks"].map(&:values).flatten.each do |ingredient|
  Ingredient.create!(name: ingredient)
  count += 1
end

puts "Ingredients #{count} created."
