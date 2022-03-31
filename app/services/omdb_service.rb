class OmdbService

   BASE_URL = "http://www.omdbapi.com/?t="  
   API_PARTIAL_URL = "&apikey=#{ENV['OMDB_API_KEY']}" 

    def self.search(search)
        @results = HTTP.get(BASE_URL + "#{search}" + API_PARTIAL_URL)
        @results
    end 

  def get_synopsis_by_title(title)
    response = HTTP.get("http://www.omdbapi.com/?apikey=#{ENV["OMDB_API_KEY"]
    }&t=#{title}").to_s
    parsed_response = JSON.parse(response)
    parsed_response["Plot"]
  end

  def get_director_by_title(title)
    response = HTTP.get("http://www.omdbapi.com/?apikey=#{ENV["OMDB_API_KEY"]
    }&t=#{title}").to_s
    parsed_response = JSON.parse(response)
    parsed_response["Director"]
  end

  def get_actor_by_title(title)
    response = HTTP.get("http://www.omdbapi.com/?apikey=#{ENV["OMDB_API_KEY"]
    }&t=#{title}").to_s
    parsed_response = JSON.parse(response)
    parsed_response["Actors"]
  end

  def get_image_by_title(title)
    response = HTTP.get("http://www.omdbapi.com/?apikey=#{ENV["OMDB_API_KEY"]
    }&t=#{title}").to_s
    parsed_response = JSON.parse(response)
    parsed_response["Poster"]
  end

end