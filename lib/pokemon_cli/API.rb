#so my goal is to pull information from the pokeapi 
#i can do this by creating a class which will be responsible for not only getting info but instantiating the objects
 # i actually have to go to my env file and require my gems first which will be rest-client,json, and pry to help 
 def self.get_data 
   response = RestClient