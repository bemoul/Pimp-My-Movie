class OmdbService

  # BASE_URL = "http://www.omdbapi.com/?t="  
  # API_PARTIAL_URL = "&apikey=#{ENV['OMDB_API_KEY']}" 

  #     def self.search(search)
  #         @results = HTTParty.get(BASE_URL + "#{search}" + API_PARTIAL_URL)
  #         @results
  #     end

  def get_synopsis_by_title(title)
    response = HTTP.get("http://www.omdbapi.com/?apikey=#{ENV["OMDB_API_KEY"]
    }&t=#{title}").to_s
    parsed_response = JSON.parse(response)
    parsed_response["Plot"]
  end
end