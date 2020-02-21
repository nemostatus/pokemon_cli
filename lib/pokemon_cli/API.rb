class API 
 def self.get_data(name)
response = RestClient.get("https://pokeapi.co/api/v2/pokemon/#{name}")
   pokemon_array = JSON.parse(response.body)["results"]
     pokemon_array.each do |pokemon|
      Pokemon.new(pokemon)
     
    end 
  end 
end 
   