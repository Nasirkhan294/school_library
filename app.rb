require_relative 'person'
require_relative 'book'
require_relative 'rental'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def list_books
    @books.each do |_book|
      puts "#{book.title} by #{book.author}"
    end
  end

  def list_people
    @people.each do |_person|
      puts "#{person.name} (ID: #{person.id})"
    end
  end

  def create_person(name, role)
    id = @people.empty? ? 1 : @people.last.id + 1
    role == 'teacher' ? Teacher.new(id, name) : Student.new(id, name)
    @people << people
    puts "Created #{role.capitalize}: #{person.name} (ID: #{person.id})"
  end

  def create_book(title, author)
    id = @books.empty? ? 1 : @books.last.id + 1
    book = Book.new(id, title, author)
    @books << book
    puts "Created book: #{book.title} by #{book.author} (ID: #{book.id})"
  end

  def create_rental(_person_id, _book_id)
    person = @people.find { |p| p.id == person.id }
    book = @books.find { |b| b.id == book.id }

    if person.nil? || book.nil?
      puts 'Person ID or Book ID not found.'
    else
      id = @rentals.empty? ? 1 : @rentals.last.id + 1
      rental = Rental.new(id, person, book)
      @rentals << rental
      puts "Created rental: #{person.name} (ID: #{person.id}) rented #{book.title} by #{book.author} (ID: #{book.id})"
    end
  end

  def list_rentals_for_person(_person_id)
    person = @people.find { |p| p.id == person.id }

    if person.nil?
      puts 'Person ID not found'
    else
      puts "Rentals for #{person.name} (ID: #{person.id}):"
      rentals = @rentals.select { |r| r.person == person }

      if rentals.empty?
        puts 'No rentals found for this person'
      else
        rentals.each do |_rental|
          puts "#{rental.book.title} by # {rental.book.author}"
        end
      end
    end
  end
end
