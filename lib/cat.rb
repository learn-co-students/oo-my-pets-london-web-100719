class Cat
  attr_accessor :owner, :mood
  attr_reader :name

  @@all = []
  
  def initialize(name, owner)
    @name = name
    @owner = owner
    @mood = 'nervous'
    @@all << self
  end

  def self.all
    @@all
  end
end

# Cat
#   Instance methods
#     initializes with a name and an Owner
#     can change its owner 
#     can't change its name 
#     initializes with a nervous mood 
#     can change its mood 
#   Class methods
#     knows all the cats 