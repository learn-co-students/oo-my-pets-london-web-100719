class Owner
  # code goes here
  attr_reader :name, :species

  @@all = []

  def initialize(name, species="human")
    @species = species
    @name = name
    @@all << self
  end

  def say_species
    "I am a #{self.species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all = []
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def cats
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def walk_dogs
    self.dogs.select {|dog| dog.mood = "happy"}
  end

  def feed_cats
    self.cats.select {|cat| cat.mood = "happy"}
  end

  def sell_pets
    self.dogs.select {|dog| dog.mood = "nervous"}
    self.dogs.select {|dog| dog.owner = nil}
    self.cats.select {|cat| cat.mood = "nervous"}
    self.cats.select {|cat| cat.owner = nil}
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end


end