class Pokemon 

attr_accessor :name,:type,:move,:ability
 
  @@all = []

  def initialize(attr_hash)
    attr_hash.each do |k,v|
      self.send("#{k}=",v) if self.respond_to?("#{k}=")
      @type =[]
      @move = [] 
      @ability = []
  end 
  save 
end 
def able=(able)
  @able = able 
end 
def able 
  puts @ability 
end 


def save 
  @@all << self 
end 

def self.all 
  @@all
end 

def self.find_by_name(name)
  self.all.select do |x|
     x.name == name
     
end
 end 
 end


