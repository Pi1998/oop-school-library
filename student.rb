require './person'

class Student < Person
  attr_accessor :classroom

  def initialize(id, _age, classroom, name: 'Unknown')
    super(id, name)
    @classroom = classroom
  end
end
