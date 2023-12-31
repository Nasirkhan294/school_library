require_relative 'person'
require_relative 'student'
require_relative 'classroom'

# The personCreator class responsible for creating new Person objects

class PersonCreator
  def initialize(people)
    @people = people
  end

  def create_student
    name = read_person_name_from_user_input('Student')
    age = read_person_age_from_user_input
    parent_permission = read_parent_permission_from_user_input
    classroom_label = read_classroom_label_from_user_input

    create_new_student(name, age, parent_permission, classroom_label)
    puts 'Student created successfully:'
  rescue ArgumentError => e
    puts "Error: #{e.message}"
  end

  def read_person_name_from_user_input(type)
    print "#{type} name: "
    gets.chomp
  end

  def read_person_age_from_user_input
    print 'Age: '
    gets.chomp.to_i
  end

  def read_parent_permission_from_user_input
    print 'Has parent permission? (y/n): '
    gets.chomp.downcase == 'y'
  end

  def read_classroom_label_from_user_input
    print 'Classroom label: '
    gets.chomp
  end

  def create_new_student(name, age, parent_permission, classroom_label)
    student = Student.new(name, age, parent_permission: parent_permission,
                                     classroom: Classroom.new(classroom_label))
    @people << student
    student
  end

  def create_teacher
    name = read_person_name_from_user_input('Teacher')
    age = read_person_age_from_user_input
    specialization = read_teacher_specialization_from_user_input

    create_new_teacher(name, age, specialization)
    puts 'Teacher created successfully:'
  rescue ArgumentError => e
    puts "Error: #{e.message}"
  end

  def read_teacher_specialization_from_user_input
    print 'Specialication: '
    gets.chomp
  end

  def create_new_teacher(name, age, specialization)
    teacher = Teacher.new(name, age, specialization)
    @people << teacher
    teacher
  end
end
