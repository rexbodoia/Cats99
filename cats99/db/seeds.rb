# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

CAT_COLORS = %w(black white orange brown)
10.times do |_|
  Cat.create(name: Faker::Pokemon.name, birth_date: Faker::Date.birthday(0,25), color: CAT_COLORS.sample, sex: ['M','F'].sample, description: Faker::Lorem.sentence)
  user = User.new(username: Faker::Cannabis.strain)
  user.password = Faker::Lorem.sentence(6)
  user.reset_session_token!
  user.save!
  start_date = Faker::Date.backward(200)
  CatRentalRequest.create(cat_id: Cat.all.sample.id, start_date: start_date, end_date: start_date + 2, status: ['DENIED', 'APPROVED', 'PENDING'].sample)
end