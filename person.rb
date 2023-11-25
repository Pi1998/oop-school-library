require_relative 'nameable'

class Person < Nameable
  attr_accessor :rentals, :name, :age

  def initialize(id, name)
    super()
    @id = id
    @name = name
    @rentals = [] # To store rentals
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end
end
