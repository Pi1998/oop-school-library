class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @book = book
    @person = person
    @date = date
  end
end
