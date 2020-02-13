class API 
 def self.get_data 
   response = RestClient.get("https://pokeapi.co/api/v2/pokemon/")
   pokemon_array = JSON.parse(response.body)["results"]
 end 
   