class PokemonCli::CLI
  @@poke_stats = [ "abilities","base_experience","weight","height","moves","types"]
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
   Pokemon.all.clear
 API.get_data(name =nil,key = "results")
  Pokemon.all.each_with_index do |pokemon,index|
      puts "#{index + 1}. #{pokemon.name}"
     end 
    pokemon_choice
  choice
   end
  
def pokemon_choice
  puts ""
   puts "Which pokemon would you like to know about?"
puts "Please enter the name of a pokemon."
puts ""
    keep_going = true
      while keep_going
    name = gets.strip.downcase
     puts "which stat would you like to learn more about?"
 stat_list
  stat = gets.strip.downcase
  pokemon_selection(name,stat)
end 

def pokemon_selection(name,stat)
 
  name = Pokemon.find_by_name(name)
  name.each do |poke|
   Pokemon.all << API.get_data(name ="#{poke.name}")
 end 
 end 
    
   
 

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
      puts ""
    puts poke.type["name"]
    when "abilities"
       puts poke.ability["name"]
    when "moves"
     puts poke.move["name"] 
    when "base_experience"
      
      puts ""
     puts poke["name"] 
     when "height"
       puts ""
     puts poke["name"]
    when "Weight"
      puts ""
      puts poke["name"] 
    end 
  end
     Pokemon.stats.clear
     PokemonCli::CLI.pokemon_battle.clear
end
 def stat_list
   puts ""
PokemonCli::CLI.poke_stats.each.with_index do |stat,index|
  puts "#{index + 1}. #{stat}"

   end 
 end 
   def choice 
     puts ""
     puts "Would you like to learn more stats about this pokemon,simulate a Pokemon battle,see the Pokemon list or exit?"
     puts "Choose one: stats/list/battle/exit"
     puts ""
     input = gets.strip.downcase 
     if input == "stats"
       PokemonCli::CLI.pokemon_battle.clear
      stat_list
   Pokemon.stats.clear
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
        
        puts ""
     puts a["name"] 
    when "height"
      puts ""
     puts a["name"]
    when "Weight"
      puts ""
      puts a["name"] 
      end 
  end
  Pokemon.stats.clear
  PokemonCli::CLI.pokemon_battle.clear
  choice
 elsif input == "exit"
    bye
    exit
    elsif input == "list"
    pokemon_list
    elsif input == "battle"
    pokemon_battle
   else 
  puts "Invalid pokedex entry."
   choice
 end 
 end
 
 def pokemon_battle 
   puts ""
   puts "Select 2 pokemon for a battle."
   puts "Select your first Pokemon!"
   puts "" 
   continue = true
    while continue 
   pokemon_1 = gets.strip.downcase
   Pokemon.all.each do |x|
     if pokemon_1 == x.name 
       continue = false 
     end 
   end 
 end 
 puts ""
   puts "#{pokemon_1.capitalize},I choose you!!"
   name = pokemon_1
   stat = "base_experience"  
  API.more_data(name,stat)
  puts ""
   puts "Select your second Pokemon!"
   puts ""
     continue = true
    while continue
   pokemon_2 = gets.strip.downcase 
    Pokemon.all.each do |x|
     if pokemon_2 == x.name 
       continue = false 
     end 
   end 
 end
 puts ""
   puts "#{pokemon_2.capitalize},I choose you!!"
   name = pokemon_2
   stat = "base_experience"
  API.more_data(name,stat)
  if  PokemonCli::CLI.pokemon_battle[0] >  PokemonCli::CLI.pokemon_battle[1]
    puts ""
    puts "#{pokemon_1.upcase} is the winner !!"
    final_choice
  else 
    puts ""
    puts "#{pokemon_2.upcase} is the winner !!"
    final_choice
   
end
end

def final_choice 
  puts ""
     puts "Would you like to continue to battle,return to the pokemon list, or exit?"
    puts "Choose one: battle/list/exit"
    puts ""
    input = gets.strip.downcase 
    if input == "battle"
      PokemonCli::CLI.pokemon_battle.clear
      
      pokemon_battle
    elsif input == "list"
    PokemonCli::CLI.pokemon_battle.clear
    pokemon_list
  elsif input == "exit"
  bye 
  exit 
else 
  puts "Invalid pokedex entry."
  final_choice
  end 
end 

def bye 
    puts "Enjoy your journey and try to catch 'em all!"
  end 
end 
