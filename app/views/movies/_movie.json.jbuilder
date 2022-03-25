json.extract! movie, :id, :title, :synopsis, :director, :year_of_release, :created_at, :updated_at
json.url movie_url(movie, format: :json)
