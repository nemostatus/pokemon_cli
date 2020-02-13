class PokemonCli::CLI
  def call 
    puts "Welcome pokemon trainer!!"
    puts "To use your pokedex and view a pokemon enter: 'pokedex'."
    puts "To continue on your adventure enter 'exit'."
    
    API.get_data
    choice
  end 
   def choice
    input = gets.strip.downcase
    if input == "pokedex"
      pokemon_list
      choice
      elsif input == "exit"
      bye
    else 
      invalid_entry
  end 
end 

def pokemon_list
  
 Pokemon.all.each_with_index do |pokemon,index|
      puts "#{index + 1}. #{pokemon.name}"
    end 
   puts ""
   puts ""
 end 
 
  def invalid_entry
    puts "Invalid pokedex entry."
      choice
  end
  
  def bye 
    puts "Enjoy your journey and try to catch 'em all!"
  end 
   
  
end 
