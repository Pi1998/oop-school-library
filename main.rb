# main.rb

require_relative 'app'

# Create an instance of SchoolLibraryApp
app = SchoolLibraryApp.new

# Helper method to display menu options
def display_menu_options
  puts "\nPlease choose an option by entering a number:"
  puts '1. List all books'
  puts '2. List all people'
  puts '3. Create a person'
  puts '4. Create a book'
  puts '5. Create a rental'
  puts '6. List all rentals for a given person id'
  puts '7. Exit'
end

# Call the main method to run the application
app.main(method(:display_menu_options))
