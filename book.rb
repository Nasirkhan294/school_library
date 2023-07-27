class Book
  attr_accessor :title, :author

  def initialize(title, author)
    @title = title
    @author = author
  end

  def add_rental(person, date)
    rental = Rental.new(date, self, person)
    @rentals.push(rental)
  end
end
