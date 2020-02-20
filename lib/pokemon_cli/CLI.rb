class PokemonCli::CLI
  @@poke_stats = [ "abilities","base_experience","weight","height","moves","types"]
  def self.poke_stats
    @@poke_stats
  end
  def start 
    puts "Welcome pokemon trainer!!"
    puts "To use your pokedex and view a pokemon enter: 'pokedex'."
    puts "To continue on your adventure enter 'exit'."
   menu
  end 
  
  def menu
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
  API.get_data
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
      puts "Please enter the name of a pokemon."
    keep_going = true
      while keep_going
    name = gets.strip.downcase
    Pokemon.all.each do |x|
      if name == x.name 
   Pokemon.name_selection << name 
 end 
 end
   Pokemon.all.each do |x|
     if name == x.name 
      
       keep_going = false 
   
      end 
   end 
 end
    puts "Which stats would you like to know?"
    puts "Please enter by keyword."
    stat_list
    continue = true
    while continue 
    stat = gets.strip.downcase
    PokemonCli::CLI.poke_stats.each do |x|
      if stat == x
        continue = false
      end 
    end
  end 
   API.more_data(name,stat)

   
  Pokemon.stats.each do |poke|
    case stat
    when "types"
    puts poke.type["name"]
    when "abilities"
    puts poke.ability["name"]
    when "moves"
      puts poke.move["name"] 
    when "base_experience"
     puts poke["name"] 
    when "height"
     puts poke["name"]
    when "Weight"
      puts poke["name"] 
    end 
  end
end

   def stat_list
PokemonCli::CLI.poke_stats.each.with_index do |stat,index|
  puts "#{index + 1}. #{stat}"
   end 
 end 
   
   
   def choice 
     puts "Would you like to learn more stats about this pokemon,Pokemon list or exit?"
     puts " stats/list/exit"
     input = gets.strip.downcase 
     if input == "stats"
      stat_list
   
   name = Pokemon.name_selection[0]
      continue = true 
      while continue 
     stat = gets.strip.downcase
     Pokemon.stats.clear
     PokemonCli::CLI.poke_stats.each do |x|
      if stat == x
        continue = false
      end 
    end
  end
  
   API.more_data(name,stat)
     Pokemon.stats.each do |a|
    case stat
    when "types"
    puts a.type["name"]
    when "abilities"
    puts a.ability["name"]
    when "moves"
      puts a.move["name"] 
    when "base_experience"
     puts a["name"] 
    when "height"
     puts a["name"]
    when "Weight"
      puts a["name"] 
      
    end 
  end
  choice
 
 
 elsif input == "exit"
    bye
    exit
    elsif input == "list"
    Pokemon.all.clear
    pokemon_list
   else 
   choice
 end 
 end

def bye 
    puts "Enjoy your journey and try to catch 'em all!"
  end 
end 
