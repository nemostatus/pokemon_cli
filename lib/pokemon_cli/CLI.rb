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
    pokemon_stats
   choice
   end
   def pokemon_stats 
      puts "Which pokemon would you like to know about?"
      puts "Please enter number or name of pokemon."
    name = gets.strip.downcase
    puts "Which stats would you like to know?"
    puts "Please enter by keyword."
    stat_list
    stat = gets.strip.downcase
   API.more_data(name,stat)
  Pokemon.stats.each do |poke|
    case stat
    when "types"
    puts poke.type 
    when "abilities"
    puts poke.ability 
    when "moves"
      puts poke.move 
    when "base_experience"
     puts poke 
    when "height"
     puts poke 
    when "Weight"
      puts poke 
    end 
  end
  end
   
    def stat_list
puts "1. Abilities
    2.Base_experience(xp gained for defeating this pokemon)
    3.Weight(hectograms)
    4.Height(decimetres)
    5.Moves
    6.Types"
   end 

def invalid_entry
    puts "Invalid pokedex entry."
      choice
  end
  
  def bye 
    puts "Enjoy your journey and try to catch 'em all!"
  end 
   
  
end 
