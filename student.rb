require_relative 'person'

class Student < Person
  attr_reader :classroom
  attr_accessor :parent_permission

  def initialize(id, _age, classroom, name: 'Unknown', parent_permission: false)
    super(id, name)
    @classroom = classroom
    @parent_permission = parent_permission
    classroom&.add_student(self)
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def to_s
    "[Student] Name: #{@name}, ID: #{@id}, Age: #{@age}"
  end
end
