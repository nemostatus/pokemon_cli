class API 
 def self.get_data(name=nil,key)
response = RestClient.get("https://pokeapi.co/api/v2/pokemon/#{name}")
   pokemon_array = JSON.parse(response.body)["#{key}"]
   case key 
   when "results"
 pokemon_array.each do |poke|
      Pokemon.new(poke)
    end
  when "abilities"
      name.ability << pokemon_array["ability"]
  when "moves"
    name.move << pokemon_array["move"]
  when "types"
    name.type << pokemon_array["type"]
     
 end   
end
 end  
 
