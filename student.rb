require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(id, _age, classroom, name: 'Unknown')
    super(id, name)
    @classroom = classroom
    classroom&.add_student(self)
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
