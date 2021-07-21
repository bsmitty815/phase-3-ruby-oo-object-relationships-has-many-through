require "pry"

class Customer
  
    @@all = []

    attr_accessor :name, :age

    def initialize(name, age)
        @name = name
        @age = age
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(waiter, total, tip)
        #make a new meal using the current waiter then pass through the three arugemnts and self to get the customer
        Meal.new(waiter, self, total, tip)
    end

    def meals
        # you get the meal class and the all array itterate it using select method and then see
        # which customer is equal to self
        Meal.all.select {|meal| meal.customer == self}
    end

    def waiters
        # call on the meals method that already gives us a list of that customers meals itterate through
        # that and return the waiters associated with the meals
        meals.map do |meal|
            meal.waiter
        end
    end



end