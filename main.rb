require_relative 'lib/app'

def main
    app = App.new

    loop do 
        puts "Please choose an option by entering a number:"
        puts "1. List all books"
        puts "2. List all people"
        puts "3. Create a person"
        puts "4. Create a book"
        puts "5. Create a rental"
        puts "6. List all rentals for a person"
        puts "7. exit"

        choice = gets.chomp.to_i


        case choice 
        when 1
            app.list_books
        when 2
            app.list_people
        when 3
            puts "Enter teacher's name: "
            name = gets.chomp
            app.create_person(name, 'teacher')
        when 4 
            puts "Enter student's name:"
            name = gets.chomp
            app.create_person(name, 'student')
        when 5
            puts "Enter book title:"
            title = gets.chomp
            puts "Enter book author:"
            author = gets.chomp
            app.create_book(title, author)
        when 6
            puts "Enter person ID who is renting the book:"
            person_id = gets.chomp.to_i
            puts "Enter book ID to be rented:"
            book_id = gets.chomp.to_i
            app.create_rental(person_id, book_id)
        when 7 
            puts "Enter person ID to list their rentals:"
            person_id = gets.chomp.to_i
            app.list_rentals_for_person(person_id)
        when 8
            puts "Exiting the app. Goodbye!"
            break
        else
            puts "Invalid choice. Please try again."
        end

        puts "\n" # Adding a newline for better formatting
    end
end

main