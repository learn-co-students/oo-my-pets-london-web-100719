class Owner
  attr_reader :name, :species
  @@all = []
  #@@cats = []
  #@@dogs = []

  def initialize(name)
    @name = name
    @species = 'human'
    @@all << self
  end

  def self.all
    @@all
  end
  
  def say_species
    "I am a #{@species}."
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.select { |cat| cat.owner == self }
  end

  def dogs
    Dog.all.select { |dog| dog.owner == self }
  end

  def buy_cat(name)
    Cat.new(name, self)
    self.cats
  end

  def buy_dog(name)
    Dog.new(name, self)
    self.dogs
  end

  def walk_dogs
    dogs.each { |dog| dog.mood = 'happy' }
  end

  def feed_cats
    cats.each { |cat| cat.mood = 'happy' }
  end

  def sell_pets
    dogs.each { |dog| dog.mood = 'nervous' }
    dogs.each { |dog| dog.owner = nil }
    cats.each { |cat| cat.mood = 'nervous' }
    cats.each { |cat| cat.owner = nil }
  end

  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end

end

# Owner instance methods
# #cats
#   returns a collection of all the cats that belong to the owner
# #dogs
#   returns a collection of all the dogs that belong to the owner
# #buy_cat
#   can buy a cat that is an instance of the Cat class
#   knows about its cats
# #buy_dog
#   can buy a dog that is an instance of the Dog class
#   knows about its dogs
# #walk_dogs
#   walks the dogs which makes the dogs' moods happy
# #feed_cats
#   feeds cats which makes the cats' moods happy
# #sell_pets
#   can sell all its pets, which makes them nervous 
#   can sell all its pets, which leaves them without an owner 
# #list_pets
#   can list off its pets 



