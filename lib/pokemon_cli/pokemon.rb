class Pokemon 

attr_accessor :name 
  
  @@all = []
  @@stats = []
  def initialize(attr_hash)
    attr_hash.each do |k,v|
      self.send("#{k}=",v) if self.respond_to?("#{k}=")
end 
  save 
  stat_save
end 

def stat_save 
  @@stats << self 
end 

def self.stats 
  @@stats 
end 

def save 
  @@all << self 
end 

def self.all 
  @@all
end 
def self.find_by_name(name)
  self.all.select do |pokemon| 
    pokemon.name.downcase == name  
     end 
end 
end 

