require './nameable'

class Person < Nameable
  attr_accessor :id, :name, :age

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
  end

  private

  def of_age?
    @age >= 18
  end

  def can_use_services?
    of_age? || parent_permission
  end
end
