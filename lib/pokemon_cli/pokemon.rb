class Pokemon 

attr_accessor :name,:type,:move,:ability
  @@name_selection =[]
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
def self.name_selection 
  @@name_selection
end

def self.all 
  @@all
end 

 
end 

