require_relative 'nameable'

class Person < Nameable
  attr_reader :rentals, :name

  def initialize(id, name)
    super()
    @id = id
    @name = name
    @rentals = [] # To store rentals
  end

  def add_rental(rental)
    @rentals << rental
  end
end
