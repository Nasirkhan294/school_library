require_relative '../decorators/nameable'

class Person < Nameable
  attr_accessor :id, :name, :age, :rentals

  def initialize(name, age, parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @rentals = []
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end

  def can_use_services?
    of_age? || parent_permission
  end

  def correct_name
    @name
  end

  def to_hash
    {
      age: @age,
      name: @name
    }
  end

  def self.from_hash(hash)
    age = hash['age']
    name = hash['name']
    new(name, age)
  end

  private

  def of_age?
    @age >= 18
  end
end
