require 'pry'

class Owner

    attr_reader :name, :species
    attr_writer
    attr_accessor

    @@all = []

    def initialize(name, species = "human")

        @name = name
        @species = species
        @@all << self
        
    end

    def say_species

        "I am a #{@species}."
        
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

    def cats

        Cat.all.select {|cat| cat.owner == self}
        
    end

    def dogs

        Dog.all.select {|dog| dog.owner == self}
        
    end

    def buy_cat(name)

        Cat.new(name, self)

    end

    def buy_dog(name)

        Dog.new(name, self)

    end

    def walk_dogs

        self.dogs.map do |dog|

            dog.mood = "happy"

        end

    end

    def feed_cats

        self.cats.map do |cat|

            cat.mood = "happy"

        end

    end

    def sell_pets
        
        pets = (self.cats << self.dogs).flatten!
        pets.each do |pet|

            pet.owner = nil
            pet.mood = "nervous"
            
        end

    end

    def list_pets

        "I have #{self.dogs.size} dog(s), and #{self.cats.size} cat(s)."

    end


end