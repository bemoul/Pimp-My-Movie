class OmdbService
  @BASE_URL = "http://www.omdbapi.com/?t="
  @API_PARTIAL_URL = "&apikey=#{ENV['OMDB_API_KEY']}"

  #     def self.search(search)
  #         @results = HTTParty.get(BASE_URL + "#{search}" + API_PARTIAL_URL)
  #         @results
  #     end
 
 


  def the_reponse(title)
    begin
      @parsed_response
      @uri = URI("http://www.omdbapi.com/?apikey=#{ENV['OMDB_API_KEY']
          }&t=#{title}")
# @uri = BASE_URL + "#{title}" + API_PARTIAL_URL
      response = HTTP.get(@uri).to_s
     @parsed_response = JSON.parse(response)
    rescue 
      puts "something wen wrong with the api"

    end 
  end



  def get_synopsis_by_title(title)  
    begin
    the_reponse(title)  
    @parsed_response['Plot']
  rescue 
    puts "something wen wrong with the synopsys"

  end 
  end

  def get_director_by_title(title) 
    begin
    the_reponse(title)
    @parsed_response['Director']
  rescue 
    puts "something wen wrong with the Director"

  end 
  end

  def get_actor_by_title(title)
    begin
    the_reponse(title)
    @parsed_response['Actors']
  rescue 
    puts "something wen wrong with the Actor"

  end 
  end

  def get_image_by_title(title)
    begin
    the_reponse(title)
      @parsed_response['Poster']
    rescue 
      puts "something wen wrong with the image"

    end 
  end

  def get_year_by_title(title)
    begin
    the_reponse(title)
     @parsed_response["Year"]
    rescue 
      puts "something wen wrong with the year"

    end 
  end

  def exist?(title)
    begin
     the_reponse(title)
     @parsed_response["Response"]
    rescue 
      puts "something wen wrong with the response"

    end 
end
end