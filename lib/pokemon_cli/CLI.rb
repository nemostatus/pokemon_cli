class PokemonCli::CLI
  def call 
    puts "Welcome pokemon trainer!!"
    puts "To use your pokedex and view a pokemon enter: 'pokedex'."
    puts "To continue on your adventure enter 'exit'."
    
    API.get_data
  end 
  
   
  
end 
