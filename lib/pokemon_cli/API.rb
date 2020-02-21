class API 
 def self.get_data(name=nil,key)
response = RestClient.get("https://pokeapi.co/api/v2/pokemon/#{name}")
   pokemon_array = JSON.parse(response.body)["#{key}"]
   if name == nil 
     pokemon_array.each do |poke|
      Pokemon.new(poke)
    else
   end   
end
 end  
 
