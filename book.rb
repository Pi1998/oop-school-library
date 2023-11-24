class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = [] # Initialize an empty array to store rentals
  end

  def add_rental(rental)
    @rentals << rental
  end
end
