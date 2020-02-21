class Pokemon 

attr_accessor :name,:type,:move,:ability
 
  @@all = []

  def initialize(attr_hash)
    attr_hash.each do |k,v|
      self.send("#{k}=",v) if self.respond_to?("#{k}=")
  end 
  save 
end 

def save 
  @@all << self 
end 

def self.all 
  @@all
end 

def self.find_by_name(pokemon)
  Pokemon.all.select do |x|
   x.name == pokemon 
 end 
end 
end 

