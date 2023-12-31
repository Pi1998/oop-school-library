class Classroom
  attr_accessor :label
  attr_reader :students

  def initialize(label)
    @label = label
    @students = [] # To store students
  end

  def add_student(student)
    @students << student
    student.classroom = self unless student.classroom == self
  end
end
