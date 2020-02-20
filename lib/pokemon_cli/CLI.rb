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
   Pokemon.all.clear
 API.get_data
  Pokemon.all.each_with_index do |pokemon,index|
      puts "#{index + 1}. #{pokemon.name}"
     end 
    pokemon_stats
  choice
   end
  
def pokemon_stats 
      puts "Which pokemon would you like to know about?"
      puts "Please enter the name of a pokemon."
    keep_going = true
      while keep_going
    name = gets.strip.downcase
    invalid
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
     Pokemon.stats.clear
end
 def stat_list
PokemonCli::CLI.poke_stats.each.with_index do |stat,index|
  puts "#{index + 1}. #{stat}"
   end 
 end 
   def choice 
     puts "Would you like to learn more stats about this pokemon,simulate a Pokemon battle,Pokemon list or exit?"
     puts " stats/list/battle/exit"
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
        PokemonCli::CLI.pokemon_battle.clear
     puts a["name"] 
    when "height"
     puts a["name"]
    when "Weight"
      puts a["name"] 
      end 
  end
  Pokemon.stats.clear
  choice
 elsif input == "exit"
    bye
    exit
    elsif input == "list"
    pokemon_list
    elsif input == "battle"
    pokemon_battle
   else 
   invalid
 end 
 end
 
 def pokemon_battle 
   puts "Select 2 pokemon for a battle."
   puts "Select your first Pokemon!"
   continue = true
    while continue 
   pokemon_1 = gets.strip.downcase
   Pokemon.all.each do |x|
     if pokemon_1 == x.name 
       continue = false 
     end 
   end 
 end 
   puts "I choose you #{pokemon_1}!!"
   name = pokemon_1
   stat = "base_experience"  
  API.more_data(name,stat)
   puts "Select your second Pokemon!"
     continue = true
    while continue
   pokemon_2 = gets.strip.downcase 
    Pokemon.all.each do |x|
     if pokemon_2 == x.name 
       continue = false 
     end 
   end 
 end
   puts "I choose you #{pokemon_2}!!"
   name = pokemon_2
   stat = "base_experience"
  API.more_data(name,stat)
  if  PokemonCli::CLI.pokemon_battle[0] >  PokemonCli::CLI.pokemon_battle[1]
    puts "#{pokemon_1} is the winner !!"
    final_choice
  else 
    puts "#{pokemon_2} is the winner !!"
    final_choice
   
end
end

def final_choice 
     puts "Would you like to continue to battle,return to the pokemon list, or exit?"
    puts "Choose one: battle/list/exit"
    input = gets.strip.downcase 
    if input == "battle"
      PokemonCli::CLI.pokemon_battle.clear
      pokemon_battle
    elsif input == "list"
    pokemon_list
  elsif input == "exit"
  bye 
  exit 
else 
  invalid
  end 
end 
def invalid 
  puts "Invalid pokedex entry."
 end 
 
  
def bye 
    puts "Enjoy your journey and try to catch 'em all!"
  end 
end 
