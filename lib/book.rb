class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, date)
    rental = Rental.new(date, self, person)
    @rentals << rental
    person.add_rental(rental)
  end

  def to_hash
    {
      title: @title,
      author: @author
    }
  end

  def self.from_hash(hash)
    title = hash['title']
    author = hash['author']
    new(title, author)
  end
end
