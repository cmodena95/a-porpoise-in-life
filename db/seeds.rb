# require 'faker'
require "open-uri"

p "destroying everything"
User.destroy_all
Porpoise.destroy_all
Booking.destroy_all
Review.destroy_all

user1 = User.new(
    email: "g@gmail.com",
    password: 123456,
    first_name: "dsfdsf",
    last_name: "dfsdfs"
)
p "#{user1.email} was created"

user2 = User.new(
    email: "c@gmail.com",
    password: 123456,
    first_name: "dsfdsf",
    last_name: "dfsdfs"
)
p "#{user2.email} was created"


file1 = URI.open('https://images.unsplash.com/photo-1570481662006-a3a1374699e8?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1065&q=80')
porpoise1 = Porpoise.new(
    name: "louise",
    species: "vaquita",
    location: "Barcelona",
    price: 10
)
porpoise1.user = user1
porpoise1.photos.attach(io: file1, filename: 'porp1.png', content_type: 'image/png')
porpoise1.save

p "#{porpoise1.name} was created"


file2 = URI.open('https://images.unsplash.com/photo-1591706083700-cf05c6be75e2?ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8ZG9scGhpbnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60')
porpoise2 = Porpoise.new(
    name: "louise",
    species: "vaquita",
    location: "Barcelona",
    price: 10
)
porpoise2.user = user2
porpoise2.photos.attach(io: file2, filename: 'porp2.png', content_type: 'image/png')
porpoise2.save

p "#{porpoise1.name} was created"




booking = Booking.new(
    start_date: "2021-12-11",
    end_date: "2021-12-14"
)
booking.user = user1
booking.porpoise = porpoise2
booking.save
p "Booking for #{booking.user.email} and #{booking.porpoise.name} was created"

review = Review.new(
    rating: 5,
    content: "kdjflks kdjflks kdjflks kdjflks kdjflks kdjflks kdjflks kdjflks kdjflks kdjflks",
    title: "great porpoise"
)
review.booking = booking
review.save

p "#{review.title} was created"
