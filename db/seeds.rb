# require 'faker'

p "destroying everything"
User.destroy_all
Porpoise.destroy_all
Booking.destroy_all
Review.destroy_all

user = User.new(
    email: "g@gmail.com",
    password: 123456,
    first_name: "dsfdsf",
    last_name: "dfsdfs"
)
p "#{user.email} was created"

porpoise = Porpoise.new(
    name: "louise",
    species: "vaquita",
    location: "Barcelona",
    price: 10
)
porpoise.user = user
porpoise.save

p "#{porpoise.name} was created"

booking = Booking.new(
    start_date: "2021-12-11",
    end_date: "2021-12-14"
)
booking.user = user
booking.porpoise = porpoise
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
