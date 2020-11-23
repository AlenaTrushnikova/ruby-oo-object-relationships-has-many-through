class Waiter
    attr_accessor :name, :yrs_expirience

    @@all = []

    def initialize(name, yrs_expirience)
        @name = name
        @yrs_expirience = yrs_expirience
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip=0)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select{|meal| meal.waiter == self}
    end

    def best_tipper
        best_tipped_meal = meals.max{|meal_a, meal_b| meal_a.tip <=> meal_b.tip}
        best_tipped_meal.customer
    end

end