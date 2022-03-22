# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Actor.destroy_all
Category.destroy_all
Comment.destroy_all
Movie.destroy_all
Music.destroy_all
Rating.destroy_all
User.destroy_all



10.times do |i|
  Music.create(
    title: Faker::Music.instrument,
    band: Faker::Music.band,
    style: Faker::Music.genre
  )
end

10.times do |i|

    user = User.create(
        email: 'user-mail' + "#{i}" + '@yopmail.com',
        password: 'password'+"#{i}",
        password_confirmation: 'password'+"#{i}"
    )


    movie= Movie.create(
    title: Faker::Movie.title,
    synopsis: 'Lorem ipsum ...',
    director: Faker::Games::SuperMario.character,
    release_date: rand(1923...2022),
    user_id: User.all.sample.id
  )

  comment = Comment.new(
    description: 'Lorem ipsum ...',
    create_date: Faker::Date.between(from: '2022-03-20', to: '2022-04-25'),
    user_id: User.all.sample.id,
    movie_id: Movie.all.sample.id
  )

  # comment.Movie.all.sample
  # comment.User.all.sample
  comment.movie
  comment.user
  comment.save


end

10.times do |i|
  Category.create(
    style: Faker::Book.genre
  )
end

10.times do |i|
  Actor.create(
    full_name: Faker::TvShows::Friends.character
  )
end
10.times do |i|
    Rating.create(
      user_id: User.all.sample.id,
      movie_id: Movie.all.sample.id
    )
  end