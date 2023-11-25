# app.rb
require_relative 'classroom'
require_relative 'book'
require_relative 'rental'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require 'securerandom'

class SchoolLibraryApp
  attr_accessor :classrooms, :books, :people, :rentals

  def initialize
    @classrooms = []
    @books = []
    @people = []
    @rentals = []
  end

  def list_all_books
    puts 'List of all books:'
    @books.each_with_index do |book, index|
      puts "#{index}. Title: #{book.title}, Author: #{book.author}"
    end
  end

  def list_all_people
    puts 'List of all people:'
    @people.each_with_index do |person, _index|
      puts person
    end
  end

  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    type = gets.chomp.to_i

    puts 'Age: '
    age = gets.chomp.to_i

    puts 'Name: '
    name = gets.chomp

    id = SecureRandom.random_number(1000) + 1

    case type
    when 1
      create_student(id, age, name)
    when 2
      create_teacher(id, age, name)
    else
      puts 'Invalid option.'
    end
  end

  def create_student(id, age, name)
    puts 'Has parent permission? [Y/N]: '
    permission = gets.chomp.downcase == 'y'
    person = Student.new(id, age, nil, name: name, parent_permission: permission)
    @people << person
    puts 'Student created successfully'
  end

  def create_teacher(id, age, name)
    puts 'Specialization: '
    specialization = gets.chomp
    person = Teacher.new(id, age, specialization, name: name)
    @people << person
    puts 'Teacher created successfully'
  end

  def create_book
    puts 'Title:'
    title = gets.chomp

    puts 'Author:'
    author = gets.chomp

    book = Book.new(title, author)
    @books << book
    puts 'Book created successfully'
  end

  def create_rental
    puts "\nSelect a book from the following list by number"
    display_books
    book_number = gets.chomp.to_i

    puts "\nSelect a person from the following list by number (not id)"
    display_people
    person_number = gets.chomp.to_i

    puts "\nDate: #{Time.now.strftime('%Y/%m/%d')}"

    selected_book = @books[book_number]

    if selected_book.is_a?(Book)
      rental = Rental.new(Time.now, selected_book, @people[person_number])
      @rentals << rental
      @people[person_number].add_rental(selected_book, Time.now) # Associate rental with person
      puts 'Rental created successfully'
    else
      puts 'Invalid book selection. Rental not created.'
    end
  end

  # Add these helper methods to display books and people
  def display_books
    @books.each_with_index do |book, index|
      puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
    end
  end

  def display_people
    @people.each_with_index do |person, index|
      puts "#{index}) #{person}"
    end
  end

  def list_rentals_for_person
    puts 'ID of person: '
    person_id = gets.chomp.to_i

    person = @people.find { |p| p.id == person_id }

    if person.nil?
      puts 'Person not found.'
    else
      puts 'Rentals:'
      person.rentals.each do |rental|
        puts "Date: #{rental.date.strftime('%Y/%m/%d')}, Book \"#{rental.book.title}\" by #{rental.book.author}"
      end
    end
  end

  def main
    loop do
      display_menu_options
      handle_user_input
    end
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  def handle_user_input
    option = gets.chomp.to_i

    case option
    when 1 then list_all_books
    when 2 then list_all_people
    when 3 then create_person
    when 4 then create_book
    when 5 then create_rental
    when 6 then list_rentals_for_person
    when 7 then exit_program
    else
      puts 'Invalid option. Please try again.'
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity

  def exit_program
    puts 'Thank you for using this app!'
    exit
  end

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
end
