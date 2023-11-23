require "./nameable.rb"

class Person < Nameable
    attr_accessor :id, :name
  
    def initialize(id, name)
      @id = id
      @name = name
    end
  
    def correct_name
      @name
    end
end
