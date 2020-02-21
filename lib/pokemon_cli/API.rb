class API 
 def self.get_data(url=,key)
   response = RestClient.get("#{url}")
   pokemon_array = JSON.parse(response.body)["#{key}"]
     pokemon_array.each do |pokemon|
      Pokemon.new(pokemon)
    end 
  end 

   