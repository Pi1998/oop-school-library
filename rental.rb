class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(book, person, date)
    @book = book
    @person = person
    @date = date
    book.add_rental(self) # Add the rental to the book
    person.add_rental(self) # Add the rental to the person
  end
end
