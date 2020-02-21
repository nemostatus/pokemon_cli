class API 
 def self.get_data(name=nil,key="results")
response = RestClient.get("https://pokeapi.co/api/v2/pokemon/#{name}")
   pokemon_array = JSON.parse(response.body)["#{key}"]
     pokemon_array.each do |pokemon|
      Pokemon.new(pokemon)
     
    end 
  end 
end 
   