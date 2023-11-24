require_relative 'person'

class Student < Person
  attr_accessor :classroom

  def initialize(id, _age, classroom, name: 'Unknown')
    super(id, name)
    @classroom = classroom
    classroom&.add_student(self)
  end
end
