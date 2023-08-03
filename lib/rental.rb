class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
    book.rentals << self
    person.rentals << self
  end

  def to_hash
    {
      data: @date,
      book: @book,
      person: @person
    }
  end

  def self.from_hash(hash)
    date = hash['date']
    book = hash['book']
    person = hash['person']
    new(date, book, person)
  end
end
