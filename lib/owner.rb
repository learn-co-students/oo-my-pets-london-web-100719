require "pry"

class Owner
  
  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    Owner.all << self
  end

  def say_species
    return "I am a #{species}."
  end

  def self.all
    @@all
  end

  def self.count
    Owner.all.size
  end

  def self.reset_all
    Owner.all.clear
  end

  def cats
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat(name)
    new_cat = Cat.new(name,self)
  end

  def buy_dog(name)
    new_dog = Dog.new(name,self)
  end

  def walk_dogs
    dogs.each {|dog| dog.mood = "happy"}
  end

  def feed_cats
    cats.each {|cat| cat.mood = "happy"}
  end

  def sell_pets

    dogs.each do |dog| 
      dog.mood = "nervous" 
      dog.owner = nil
    end

    cats.each do |cat| 
      cat.mood = "nervous" 
      cat.owner = nil
    end
  end
  
  def list_pets
    return "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end
end