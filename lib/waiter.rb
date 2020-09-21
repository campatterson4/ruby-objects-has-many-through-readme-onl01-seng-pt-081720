class Waiter

  attr_accessor :name, :yrs_exp

  @@all = []

  def initialize(name, yrs_exp)
    @name = name
    @yrs_exp = yrs_exp
    @@all << self
  end

  def self.all
    @@all
  end

  # OBJECT RELATIONSHIPS - #new_meal, #meals, #best_tippers

  # Initialize a meal using the current Waiter instance, 
    # a provided Customer instance and a total and tip
  def new_meal(customer, total, tip=0)
    Meal.new(self, customer, total, tip)
  end

  # Returns an Array of Meal instances associated with this waiter
  def meals
    Meal.all.select do |meal|
      meal.waiter == self
    end
  end

  # Returns Customer instance associated with the meal that 
    # received the largest tip
  def best_tipper
    best_tipped_meal = meals.max do |meal_a, meal_b|
      meal_a.tip <=> meal_b.tip
    end

    best_tipped_meal.customer
  end

end