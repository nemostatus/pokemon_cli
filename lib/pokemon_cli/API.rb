class API 
 def self.get_data(name=nil,key)
response = RestClient.get("https://pokeapi.co/api/v2/pokemon/#{name}")
   pokemon_array = JSON.parse(response.body)["#{key}"]
     pokemon_array.each do |pokemon|
      Pokemon.new(pokemon)
      if name != nil 
        Pokemon.find_by_name(name) << pokemon
        
       
    end
  end 
end 
 end  