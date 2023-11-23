require './person'

class Teacher < Person
    attr_accessor :specialization
  
    def initialize(id, age, specialization, name: "Unknown", parent_permission: true)
      super(id, name)
      @specialization = specialization
    end
  
    # Override 
    def can_use_services?
      true
    end
end
