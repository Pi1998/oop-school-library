require './person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(id, _age, specialization, name: 'Unknown')
    super(id, name)
    @specialization = specialization
  end

  # Override
  def can_use_services?
    true
  end
end
