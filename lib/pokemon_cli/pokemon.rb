class Pokemon 
#I'm going to save my data in case ide crashes
  attr_accessor :name 
  
  @@all = []
  def initialize 
     
  end 
  save 
end 

def save 
  @@all << self 
end 

