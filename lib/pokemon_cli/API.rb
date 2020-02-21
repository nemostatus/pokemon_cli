class API 
 def self.get_names
response = RestClient.get("https://pokeapi.co/api/v2/pokemon/")
   pokemon_array = JSON.parse(response.body)["results"]
   pokemon_array.each do |poke|
      Pokemon.new(poke)
end   
end
  
def self.get_abilities(name)
  response = RestClient.get("https://pokeapi.co/api/v2/pokemon/#{name}/")
  ability_array = JSON.parse(response.body)["abilities"]
Pokemon.find_by_name("#{name}").each do |x| 
if x == "@ability" 
  "#{name}".able << ability_array
end 
end
end
end 
