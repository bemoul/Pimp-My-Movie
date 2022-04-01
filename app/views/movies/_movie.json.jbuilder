# frozen_string_literal: true

json.extract! movie, :id, :title, :synopsis, :director, :release_date, :created_at, :updated_at
json.url movie_url(movie, format: :json)
