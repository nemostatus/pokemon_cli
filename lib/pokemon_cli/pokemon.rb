class Pokemon 

attr_accessor :name,:type,:move,:ability
  
  @@all = []
  @@stats = []
  def initialize(attr_hash)
    attr_hash.each do |k,v|
      self.send("#{k}=",v) if self.respond_to?("#{k}=")
  end 
  save 
  
end 

def save 
  @@all << self 
end 
def self.stats 
  @@stats
end

def self.all 
  @@all
end 
def self.find_by_name(name,stat)
  self.stats.select do |pokemon| 
    pokemon.name.downcase == name 
    
     end 
end 
end 

