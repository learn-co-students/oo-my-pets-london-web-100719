class Owner
  attr_reader :name, :species

  @@all = []

  def initialize(name, species = "human")
    @name = name
    @species = species
    @@all << self
  end 
  
  def say_species
    sayit = "I am a #{self.species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all 
    @@all.clear
  end

  def cats
    Cat.all.select { |cat| cat.owner == self}
  end 

  def dogs 
    Dog.all.select { |dog| dog.owner == self}
  end

  def buy_cat(name)
    Cat.new(name, self)
  end 

  def buy_dog(name)
    Dog.new(name, self)
  end 

  def walk_dogs
    self.dogs.map {|dog| dog.mood = "happy"} 
  end 

  def feed_cats
    self.cats.map {|cat| cat.mood = "happy"}
  end 

  def sell_pets
    self.dogs.map {|dog| dog.mood = "nervous"}
    self.cats.map {|cat| cat.mood = "nervous"}
    self.cats.map {|cat| cat.owner = nil}
    self.dogs.map {|dog| dog.owner = nil}
  end 

  def list_pets
    "I have #{self.dogs.size} dog(s), and #{self.cats.size} cat(s)."
  end 
end