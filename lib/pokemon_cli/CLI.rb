class PokemonCli::CLI
  def call 
    puts "Welcome pokemon trainer!!"
    puts "To use your pokedex and view a pokemon enter: 'pokedex'."
    puts "To continue on your adventure enter 'exit'."
    #making the api call here 
    API.get_data
  end 
  
  def 
  
end 
#i also need to create the beginning of my cli class