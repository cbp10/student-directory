@students = []  # accessible to all methods
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first names
  name = gets.chomp
  while !name.empty? do
    # add student hash to the array
    @students << {name: name, cohort: :november}
    puts @students.count > 1? "Now we have #{@students.count} students" : "Now we have 1 student"
    #get another name
    name = gets.chomp
  end
end

def print_header
  puts "The students of Villians Academy"
  puts "-------------"
end

def print_student_list
  @students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end
def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
  end
end

def show_students
  print_header
  print_student_list
  print_footer
end


def interactive_menu
  loop do
    # print menu and ask user what to do
    print_menu
    # do what user has asked
    process(gets.chomp)
  end
end

interactive_menu
