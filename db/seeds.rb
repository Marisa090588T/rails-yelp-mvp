# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning database..."
Restaurant.destroy_all

20.times do
  restaurant = Restaurant.new(
    name: ['Kyoto food', 'Good Ramen', 'Nice Pizza', 'Mexican'].sample,
    phone_number: ['00000', '111111', '999999'].sample,
    address: ['Richmond', 'Flemington', 'Central'].sample,
    category: ['chinese', 'italian', 'japanese', 'french', 'belgian'].sample
  )
  restaurant.save!

  review = Review.new(
    restaurant: restaurant,
    content: ["awesome", "good", "better", "not good", "bad"].sample,
    rating: rand(1..5)
    )
  review.save!
end

puts "Finished!"
