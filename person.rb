require './nameable'

class Person < Nameable
  attr_accessor :id, :name

  def initialize(id, name)
    super()
    @id = id
    @name = name
  end

  def correct_name
    @name
  end
end
