# PokemonCli

Welcome! Thank you for checking out my cli! After all the appropriate gems listed on line 18(README.md)  are installed and ./bin/executable is entered my pokemon CLI will ask you if you would like to view your pokedex. If it's chosen then it will make an API call to the pokeAPI and get the pokemon data, unfortunately the endpoint lists only the pokemon name and pokemon url so it wasn't so easy to get all the attributes of the pokemon. Anyway my CLI then lists all of the pokemon names. Once chosen it then asks which stats you would like to see. I use this information to plug into a 2nd more flexible API call and it lists all of the data accordingly. So basically you are able to choose the pokemon and the specific data you would like. I hope you like using my Pokemon CLI. ENJOY!!

This is the structure of the cli :

                                          |--- moves
                                          |--- types 
                                          |--- base xp
pokedex ---list of pokemon names- choice -|--- weight-- stats loop/list loop/battle/or exit - loop or exit
exit -end                                 |--- height
                                          |--- abilities 
                                                     
 After selected stats are listed the user is asked if he wants to see more pokemon and stats and is brought back list of pokemon names if yes is selected.                                                    
                                                     

## Installation
IMPORTANT: ALL GEMS REQUIRED BEFORE THE CLI CAN RUN: json and rest-client, enter gem install 'gemname' into terminal.
After both gems are installed enter ./bin/executable into terminal
Add this line to your application's Gemfile:

```ruby
gem 'pokemon_cli'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pokemon_cli
    
    

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/'practical-desk-1169'/pokemon_cli. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the PokemonCli project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/'practical-desk-1169'/pokemon_cli/blob/master/CODE_OF_CONDUCT.md).
