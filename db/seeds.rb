# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
 Movie.destroy_all
# Actor.destroy_all
# Category.destroy_all
# Comment.destroy_all
# Movie.destroy_all
# Music.destroy_all
# Rating.destroy_all
# User.destroy_all

# 3.times do |_i|
#   Music.create(
#     title: Faker::Music.instrument,
#     band: Faker::Music.band,
#     style: Faker::Music.genre
#   )
# end

# 3.times do |i|
#   user = User.create(
#     email: "user-mail#{i}@yopmail.com",
#     password: "password#{i}",
#     password_confirmation: "password#{i}"
#   )

#   movie = Movie.create(
#     title: Faker::Movie.title,
#     synopsis: 'Lorem ipsum ...',
#     director: Faker::Games::SuperMario.character,
#     release_date: rand(1923...2022),
#     user_id: User.all.sample.id
#   )
100.times do 
@actors_name = ""
@title= Faker::Movie.title
puts @title
hash = OmdbService.new
        @escaped_title = CGI.escape(@title)
    if hash.exist?(@escaped_title) == "False"
         puts "movie already exist"
        
    elsif hash.exist?(@escaped_title) == "True"
        
        @movie = Movie.create(
            title: @title,
            image: hash.get_image_by_title(@escaped_title),
            synopsis: hash.get_synopsis_by_title(@escaped_title),
            director: hash.get_director_by_title(@escaped_title),
            release_date: hash.get_year_by_title(@escaped_title),
            user_id: User.first.id
        )
   


        @actors_name = hash.get_actor_by_title(@escaped_title)
        puts @actors_name
         @actors_name_array = @actors_name.split(',')
        @actors_name_array.each do |value|
            if Actor.exists?(full_name: value) == false
    
                @actor =   Actor.create(full_name: value)
            else
                @actor =       Actor.find_by(full_name: value)
            end
        @movie_actor = MovieActor.create(movie: @movie, actor: @actor)
        end
    else 
        puts "pb with the movie"
    end
end


#   comment = Comment.new(
#     description: 'Lorem ipsum ...',
#     create_date: Faker::Date.between(from: '2022-03-20', to: '2022-04-25'),
#     user_id: User.all.sample.id,
#     movie_id: Movie.all.sample.id
#   )

#   # comment.Movie.all.sample
#   # comment.User.all.sample
#   comment.movie
#   comment.user
#   comment.save
# end

# 3.times do |_i|
#   Category.create(
#     style: Faker::Book.genre
#   )
# end

# 3.times do |_i|
#   Actor.create(
#     full_name: Faker::TvShows::Friends.character
#   )
# end
# 3.times do |_i|
#   Rating.create(
#     user_id: User.all.sample.id,
#     movie_id: Movie.all.sample.id
#   )
# end
# if Rails.env.development?
#   AdminUser.create!(email: 'admin@example.com', password: 'password',
#                     password_confirmation: 'password')
# end
