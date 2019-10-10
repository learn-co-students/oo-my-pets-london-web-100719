require 'pry'

class Owner

  attr_accessor :cats
  attr_reader :name, :species

  @@all = []
  
  def initialize(name, species="human")
    @name = name
    @species = species
    @@all << self
  end 

  def say_species
    "I am a #{self.species}."
  end

  def cats
    Cat.all.select do |cat|
      cat.owner == self
    end
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def feed_cats
    cats.each do |cat|
      cat.mood = "happy"
    end
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    dogs.each {|dog| dog.mood = "happy"}
  end

  def sell_pets
    pets = cats + dogs

    pets.each do |pet|
      pet.mood = "nervous"
      pet.owner = nil
    end
  end

  def list_pets
    num_cats = cats.count
    num_dogs = dogs.count

    "I have #{num_dogs} dog(s), and #{num_cats} cat(s)."
  end

  def self.count
    self.all.count
  end 

  def self.reset_all
    self.all.clear
  end

  def self.all
    @@all
  end

end