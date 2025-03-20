# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create Users
user1 = User.create(name: "John Doe", email: "john@example.com")
user2 = User.create(name: "Jane Smith", email: "jane@example.com")

# Create Publishers
publisher1 = Publisher.create(name: "Marvel")
publisher2 = Publisher.create(name: "DC Comics")

# Create Series
series1 = Series.create(name: "The Amazing Spider-Man")
series2 = Series.create(name: "Batman")

# Create Comics
comic1 = Comic.create(title: "The Amazing Spider-Man #1", description: "First appearance of Spider-Man", user: user1, publisher: publisher1, series: series1)
comic2 = Comic.create(title: "Batman #1", description: "First appearance of Batman", user: user2, publisher: publisher2, series: series2)

# Create Reviews
Review.create(content: "Great comic!", rating: 5, user: user1, comic: comic1)
Review.create(content: "Classic!", rating: 4, user: user2, comic: comic2)
