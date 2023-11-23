require "./person.rb"

class Student < Person
    attr_accessor :classroom

    def initialize(id, age, classroomm, name: "Unknown", parent_permission: true)
        super(id, age, name: name, parent_permission: parent_permission)
        @classroom = classroom
    end

    def play_hooky
        puts "¯\(ツ)/¯"
    end

end