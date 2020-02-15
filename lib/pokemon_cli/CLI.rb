class PokemonCli::CLI
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
     menu
  elsif input == "exit"
      bye
    else 
     puts "Invalid pokedex entry."
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
    array = [ "abilities","base_experience","weight","height","moves","types"]
    array.each do |x|
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
 stats =[ "Abilities",
"Base_experience(xp gained for defeating this pokemon)",
"Weight(hectograms)",
"Height(decimetres)","Moves","Types"]
stats.each.with_index do |stat,index|
  puts "#{index + 1}. #{stat}"
   end 
 end 
   
   
   def choice 
     puts "Would you like to learn about more pokemon?"
     puts "yes/exit"
     input = gets.strip.downcase 
     if input == "yes"
      Pokemon.all.clear
      Pokemon.stats.clear
     pokemon_list
    elsif input == "exit"
    bye
    exit
   else 
   choice
 end 
 end 

def bye 
    puts "Enjoy your journey and try to catch 'em all!"
  end 
   

end 
