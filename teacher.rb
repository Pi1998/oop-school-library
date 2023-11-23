require './person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(id, age, specialization, name: 'Unknown', parent_permission: true)
    super(id, age, name: name, parent_permission: parent_permission)
    @specialization = specialization
  end

  # override can_use_services?
  def can_use_services?
    true
  end
end
