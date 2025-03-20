# Clear existing data in the correct order
Review.destroy_all
Comic.destroy_all
Series.destroy_all
Publisher.destroy_all
User.destroy_all

# Create Users and ensure they are created successfully
user1 = User.create!(name: "John Doe", email: "john@example.com")
user2 = User.create!(name: "Jane Smith", email: "jane@example.com")

puts "Created Users: #{User.count}"  # Debugging line

# Create Publishers
publisher1 = Publisher.create!(name: "Marvel")
publisher2 = Publisher.create!(name: "DC Comics")
publisher3 = Publisher.create!(name: "Image Comics")
publisher4 = Publisher.create!(name: "Dark Horse Comics")

# Create Series
series1 = Series.create!(name: "The Amazing Spider-Man", publisher: publisher1)
series2 = Series.create!(name: "Batman", publisher: publisher2)
series3 = Series.create!(name: "Saga", publisher: publisher3)
series4 = Series.create!(name: "Hellboy", publisher: publisher4)
series5 = Series.create!(name: "X-Men", publisher: publisher1)
series6 = Series.create!(name: "Superman", publisher: publisher2)

# Create Comics
comics_data = [
  { title: "The Amazing Spider-Man #1", description: "First appearance of Spider-Man", user: user1, publisher: publisher1, series: series1 },
  { title: "The Amazing Spider-Man #2", description: "The Vulture's first appearance", user: user1, publisher: publisher1, series: series1 },
  { title: "Batman #1", description: "First appearance of Batman", user: user2, publisher: publisher2, series: series2 },
  { title: "Batman #2", description: "The Joker's first appearance", user: user2, publisher: publisher2, series: series2 },
  { title: "Saga #1", description: "Beginning of the epic space opera", user: user1, publisher: publisher3, series: series3 },
  { title: "Saga #2", description: "The story continues", user: user1, publisher: publisher3, series: series3 },
  { title: "Hellboy: Seed of Destruction", description: "Hellboy's first appearance", user: user2, publisher: publisher4, series: series4 },
  { title: "Hellboy: Wake the Devil", description: "Hellboy faces new threats", user: user2, publisher: publisher4, series: series4 },
  { title: "X-Men #1", description: "First appearance of the X-Men", user: user1, publisher: publisher1, series: series5 },
  { title: "X-Men #2", description: "The X-Men face Magneto", user: user1, publisher: publisher1, series: series5 },
  { title: "Superman #1", description: "First appearance of Superman", user: user2, publisher: publisher2, series: series6 },
  { title: "Superman #2", description: "Superman faces Lex Luthor", user: user2, publisher: publisher2, series: series6 },
  # Add more comics here...
]

# Now create comics with proper user associations
comics_data.each do |comic_data|
  comic = Comic.create!(comic_data)
  puts "Created Comic: #{comic.title} with User: #{comic.user.name}"  # Debugging line
end

# Create Reviews
comics = Comic.all
comics.each do |comic|
  Review.create!(
    content: Faker::Lorem.sentence,
    rating: rand(1..5),
    user: [user1, user2].sample,  # Assign a random user to the review
    comic: comic
  )
end

puts "Seeded #{User.count} users, #{Publisher.count} publishers, #{Series.count} series, #{Comic.count} comics, and #{Review.count} reviews."
