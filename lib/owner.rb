class Owner

  attr_reader :name, :species
  @@all = []

  def initialize(name)
    @species = 'human'
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def say_species
    "I am a #{species}."
  end

  def self.count
    self.all.count
  end

  def self.reset_all
    @@all = []
  end

  def cats
    Cat.all.select { |cat| cat.owner == self }
  end

  def dogs
    Dog.all.select { |dog| dog.owner == self }
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
    self.dogs.map { |dog| dog.mood = 'happy' }
  end

  def feed_cats
    self.cats.map { |cat| cat.mood = 'happy' }
  end

  def sell_pets
    self.cats.map { |cat| cat.mood = 'nervous' }
    self.dogs.map { |dog| dog.mood = 'nervous' }
    self.dogs.map { |dog| dog.owner = nil }
    self.cats.map { |cat| cat.owner = nil }
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end