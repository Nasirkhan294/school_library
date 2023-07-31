require_relative 'lib/app'

def display_options_list
  puts 'Please choose an option by entering a number:'
  puts '1. List all books'
  puts '2. List all people'
  puts '3. Create a person'
  puts '4. Create a book'
  puts '5. Create a rental'
  puts '6. List all rentals for a person'
  puts '7. exit'
end

def read_user_choice_from_options
  gets.chomp.to_i
end

def perform_action_for_input(choice, app)
  case choice
  when 1 then app.list_books
  when 2 then app.list_people
  when 3 then app.create_person
  when 4 then app.create_book
  when 5 then app.create_rental
  when 6 then app.list_rentals_by_person_id
  else puts 'Invalid choice. Please try again.'
  end
end

def main
  app = App.new

  loop do
    display_options_list
    choice = read_user_choice_from_options

    break if choice == 7

    perform_action_for_input(choice, app)
    # Adding a newline for better formatting
    puts "\n"
  end
end

main
