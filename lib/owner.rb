class Owner
  # code goes here
  attr_reader :name, :species
  @@all  = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def self.all
    @@all
  end

  def self.count
    @@all.size
  end

  def self.reset_all
    @@all.clear
  end

  def say_species
    "I am a #{@species}."
  end

  def cats
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat(name)
    cat = Cat.new(name, self)
    cat
  end

  def buy_dog(name)
    dog = Dog.new(name, self)
    dog
  end

  def walk_dogs
    dogs.each {|dog| dog.mood = "happy"}
  end

  def feed_cats
    cats.each {|cat| cat.mood = "happy"}
  end

  def sell_pets
    all_pets = cats + dogs
    all_pets.each do |pet|
      pet.mood = "nervous"
      pet.owner = nil
    end
  end

  def list_pets
      "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  
  end



  








end