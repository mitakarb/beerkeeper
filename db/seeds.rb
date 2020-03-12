# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(
  name: "sakurai"
)

Event.create(
  start_at: Time.current,
  end_at: Time.current.tomorrow,
  location: "mitaka",
  name: "mitakarb",
  organizer_id: user.id,
  max_size: 10,
  budget: "5000",
  description: "Mitaka ruby"
)
