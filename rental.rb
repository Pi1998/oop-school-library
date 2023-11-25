class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @book = book
    @person = person
    @date = date
    book.add_rental(person, date) 
    person.add_rental(book, date) 
  end
end
