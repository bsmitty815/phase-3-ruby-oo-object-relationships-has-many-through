class Waiter

    @@all = []

    attr_accessor :name, :years

    def initialize(name, years)
        @name = name
        @years = years
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip)
        #initializes a meal using the current Waiter instance, a provided Customer instance and a total and tip
        Meal.new(self, customer, total, tip)
    end

    def meals
        # returns an Array of Meal instances associated with this waiter
        Meal.all.select do |meal|
            meal.waiter == self
        end
    end

    def best_tipper
        #returns the Customer instance associated with the meal that received the largest tip (FAILED - 1)

        # max method returns the biggest thing you are looking for in this case tip
        best_tip = meals.max do |a, b|
            a.tip <=> b.tip
            
        end
        best_tip.customer
    end


end