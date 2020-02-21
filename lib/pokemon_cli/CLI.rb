class PokemonCli::CLI
  @@poke_stats = [ "abilities","moves","types"]
  @@pokemon_battle = []
  def self.poke_stats
    @@poke_stats
  end
  def self.pokemon_battle
    @@pokemon_battle
  end 
  def start 
    puts "Welcome pokemon trainer!!"
    puts "To use your pokedex and view a pokemon enter: 'pokedex'."
    puts "To continue on your adventure enter 'exit'."
   menu
  end 
  
  def menu
    puts ""
    input = gets.strip.downcase
    if input == "pokedex"
      pokemon_list
     
  elsif input == "exit"
      bye
    else 
     puts "Invalid entry."
      menu
  end 
end 


def pokemon_list
  puts ""
  puts ""
   
 API.get_data(name =nil,key = "results")
  Pokemon.all.each_with_index do |pokemon,index|
      puts "#{index + 1}. #{pokemon.name}"
     end 
    pokemon_choice

   end
 end
  
def pokemon_choice
  puts ""
   puts "Which pokemon would you like to know about?"
puts "Please enter the name of a pokemon."
puts ""
pokemon_selection
end 


def pokemon_selection
  input = gets.strip.downcase
  puts "Which stats would you like to know?"
  stat_list
 input_2 = gets.strip.downcase
 data = API.get_data(input,input_2)
 poke = Pokemon.find_by_name(input,input_2)
puts poke

end



 
 
    
   
 

    


  

 def stat_list
   puts ""
PokemonCli::CLI.poke_stats.each.with_index do |stat,index|
  puts "#{index + 1}. #{stat}"
end
end

   
  