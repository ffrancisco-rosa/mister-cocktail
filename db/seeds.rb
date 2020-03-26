# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Destroying all..."

Ingredient.destroy_all
Cocktail.destroy_all
Dose.destroy_all
Review.destroy_all

puts "Done"
puts "Scrapping ingredients"

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients = open(url).read
ingredients = JSON.parse(ingredients)

ingredients["drinks"].each do |i|
  Ingredient.new(name: i["strIngredient1"]).save
end
puts "Done making ingredients"

puts "Creating Cocktails"

file = URI.open("https://res.cloudinary.com/frosa/image/upload/v1585246688/Mr%20Cocktail/nikita-tikhomirov-RvuaXXYuJAU-unsplash_qbfr7u.jpg")
cocktail = Cocktail.new(name: "Mojito")
cocktail.photo.attach(io: file, filename: 'demo.jpg', content_type: 'image/jpg')
cocktail.save!

file = URI.open("https://res.cloudinary.com/frosa/image/upload/v1585246687/Mr%20Cocktail/louis-hansel-shotsoflouis-Nbgwoe5Lj5I-unsplash_rla5le.jpg")
cocktail = Cocktail.new(name: "Guacamole")
cocktail.photo.attach(io: file, filename: 'demo.jpg', content_type: 'image/jpg')
cocktail.save!

file = URI.open("https://res.cloudinary.com/frosa/image/upload/v1585246592/Mr%20Cocktail/adam-jaime-dmkmrNptMpw-unsplash_arpau2.jpg")
cocktail = Cocktail.new(name: "Wooden")
cocktail.photo.attach(io: file, filename: 'demo.jpg', content_type: 'image/jpg')
cocktail.save!

file = URI.open("https://res.cloudinary.com/frosa/image/upload/v1585246592/Mr%20Cocktail/timur-romanov-GsavR7VMkpk-unsplash_xt5zsv.jpg")
cocktail = Cocktail.new(name: "Classy")
cocktail.photo.attach(io: file, filename: 'demo.jpg', content_type: 'image/jpg')
cocktail.save!

file = URI.open("https://res.cloudinary.com/frosa/image/upload/v1585246592/Mr%20Cocktail/ram-ho-l5ooCJlUgvU-unsplash_ffrp7c.jpg")
cocktail = Cocktail.new(name: "Burlesque")
cocktail.photo.attach(io: file, filename: 'demo.jpg', content_type: 'image/jpg')
cocktail.save!

file = URI.open("https://res.cloudinary.com/frosa/image/upload/v1585246591/Mr%20Cocktail/drew-beamer-KOrhUJUVIyI-unsplash_ad8xiw.jpg")
cocktail = Cocktail.new(name: "Tasty")
cocktail.photo.attach(io: file, filename: 'demo.jpg', content_type: 'image/jpg')
cocktail.save!

file = URI.open("https://res.cloudinary.com/frosa/image/upload/v1585246591/Mr%20Cocktail/ben-yang-_SJ_jJxcSJM-unsplash_c1thuh.jpg")
cocktail = Cocktail.new(name: "Vodkarin")
cocktail.photo.attach(io: file, filename: 'demo.jpg', content_type: 'image/jpg')
cocktail.save!

file = URI.open("https://res.cloudinary.com/frosa/image/upload/v1585246591/Mr%20Cocktail/wu-yi-9ds9FNzUEwM-unsplash_ca9khr.jpg")
cocktail = Cocktail.new(name: "Gin Tonique")
cocktail.photo.attach(io: file, filename: 'demo.jpg', content_type: 'image/jpg')
cocktail.save!

file = URI.open("https://res.cloudinary.com/frosa/image/upload/v1585246590/Mr%20Cocktail/jochem-raat-Y7za9e40Luk-unsplash_vgfdcu.jpg")
cocktail = Cocktail.new(name: "Covid-19")
cocktail.photo.attach(io: file, filename: 'demo.jpg', content_type: 'image/jpg')
cocktail.save!

puts "Done Creating cocktails!"
