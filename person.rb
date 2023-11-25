require_relative 'nameable'
require_relative 'rental'

class Person < Nameable
  attr_accessor :id, :rentals, :name, :age

  def initialize(id, name)
    super()
    @id = id
    @name = name
    @rentals = [] # To store rentals
  end

  def add_rental(book, date)
    if book.is_a?(Book)
      rental = Rental.new(date, book, self)
      @rentals << rental
      book.add_rental(self, date)
    else
      puts 'Invalid book. Rental not created.'
    end
  end

  def to_s
    "[Person] Name: #{@name}, ID: #{@id}, Age: #{@age}"
  end
end
