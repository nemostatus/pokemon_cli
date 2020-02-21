class PokemonCli::CLI
  def start 
    API.get_names
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
      "Bye"
    else 
      puts "Invalid entry."
      menu
    end 
  end 
  def pokemon_list
    puts ""
    puts ""
    Pokemon.all.each_with_index do |pokemon, index|
      puts "#{index + 1}. #{pokemon.name}"
    end 
    pokemon_choice
  end
  def pokemon_choice
    puts ""
    puts "Which pokemon would you like to know about?"
    puts "Please enter the name of a pokemon."
    puts ""
    input = gets.strip.downcase
    pokemon_selection(input)
  end 
  def pokemon_selection(input)
    poke = API.get_details(input)
    puts "Name: #{poke.name}"
    puts "Type: #{poke.type}"
    puts "Abilities: #{poke.ability}"
    puts "Moves: #{poke.moves}"
  end
end
#need to ask user if they want to know about another pokemon
#need to create an invalid for an invalid pokemon entry