require_relative 'book'
require_relative 'person'
require_relative 'teacher'
require_relative 'student'
require_relative 'classroom'
require_relative 'rental'
require_relative 'person_creator'
require_relative 'book_creator'
require_relative 'rental_creator'

# App class for managing rentals of rentals of the books to people
class App
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def list_books
    @books.each do |_book|
      puts "Title:\"#{book.title}\", Author: #{book.author}"
    end
  end

  def list_people
    @people.each do |_person|
      puts "[#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def create_person()
    puts 'Do you want to create a Student (1) or Teacher (2)? [Input the number]:'
    choice = gets.chomp.to_i
    person_creator = PersonCreator.new(@people)
    case choice
    when 1
      person_creator.create_student
    when 2
      person_creator.create_teacher
    end
  end

  def create_book()
    book_creator = BookCreator.new(@books)
    book_creator.create_book
  end

  def create_rental()
    rental_creator = RentalCreator.new(@books, @people, @rentals)
    rental_creator.create_rental
  end

  def list_rentals_by_person_id
    person_id = read_person_id_from_user_input
    person = find_person_by_id(person_id)

    return unless person

    rentals = get_rentals_by_person(person)

    if rentals.empty?
      puts "#{person.name} (id: #{person.id}) has no rentals."
    else
      puts "All rentals for #{person.name} (id: #{person.id}):"
      print_rentals(rentals)
    end
  end

  def read_person_id_from_user_input
    print 'Person id: '
    gets.chomp.to_i
  end

  def find_person_by_id(id)
    person = @people.find { |p| p.id == id }
    unless person
      puts "Could not find person with id #{id}."
      return nil
    end
    person
  end

  def get_rentals_by_person(person)
    @rentals.select { |r| r.person == person }
  end

  def print_rentals(rentals)
    rentals.each do |rental|
      puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
    end
  end
end