class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = [] # Initialize an empty array to store rentals
  end

  def add_rental(person, date)
    Rental.new(date, self, person)
  end
end
