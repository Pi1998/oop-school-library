require './person'

class Student < Person
    attr_accessor :classroom
  
    def initialize(id, age, classroom, name: "Unknown", parent_permission: true)
      super(id, name)
      @classroom = classroom
    end
end
