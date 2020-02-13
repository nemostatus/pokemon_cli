class API 
 def self.get_data 
   response = RestClient.get("https://pokeapi.co/api/v2/pokemon/")
   pokemon_array = JSON.parse(response.body)["results"]
     pokemon_array.each do |pokemon|
      Pokemon.new(pokemon)
    end 
  end 
  def self.stat_data(url)
    response = RestClient.get("#{url}")
    pokemon_stats = JSON.parse(response.body)["#{stat}"]
    
 end 
 end 
   