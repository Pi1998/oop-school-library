# main.rb

# Require necessary files
require_relative 'classroom'
require_relative 'book'
require_relative 'rental'
require_relative 'person'
require_relative 'student'

# Create a Classroom
classroom = Classroom.new('A101')
puts "Classroom Label: #{classroom.label}"

# Create a Student
student = Student.new(1, 18, classroom, name: 'John Doe')
puts "Student Name: #{student.name}"
puts "Student Classroom Label: #{student.classroom.label}" # Should print 'A101'

# Create another Student without specifying Classroom
student2 = Student.new(2, 20, nil, name: 'Alice')
puts "Student2 Name: #{student2.name}"
puts "Student2 Classroom Label: #{student2.classroom.nil? ? 'No Classroom Assigned' : student2.classroom.label}"

# Create a Book
book = Book.new('The Ruby Programming Language', 'Yukihiro Matsumoto')
puts "Book Title: #{book.title}"
puts "Book Author: #{book.author}"

# Create a Person
person = Person.new(3, 'Bob')
puts "Person Name: #{person.name}"

# Create a Rental through Book's add_rental method
rental_date = Time.now
book.add_rental(person, rental_date)

# Access associated data
puts "\nAssociations:"
puts "Classroom Students: #{classroom.students.map(&:name).join(', ')}"
puts "Book Rentals: #{book.rentals.map { |r| "#{r.person.name} on #{r.date}" }.join(', ')}"
puts "Person Rentals: #{person.rentals.map { |r| "#{r.book.title} on #{r.date}" }.join(', ')}"
