
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first names
  name = gets.chomp
  while !name.empty? do
    # add student hash to the array
    students << {name: name, cohort: :november}
    puts students.count > 1? "Now we have #{students.count} students" : "Now we have 1 student"
    #get another name
    name = gets.chomp
  end
  # return array of students
  students
end

def print_header
  puts "The students of Villians Academy"
  puts "-------------"
end

def print(students)
  x = 0
  while x < students.count
    puts "#{x + 1}. #{students[x][:name]} (#{students[x][:cohort]} cohort)"
    x += 1
  end
end
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

def interactive_menu
  students = [] # will be available in several iterations as declared outside of loop
  loop do
    # print menu and ask user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    # read input and save it to variable
    selection = gets.chomp
    # do what user has asked
    case selection
      when "1"
        students = input_students
      when "2"
        print_header
        print(students)
        print_footer(students)
      when "9"
        exit
      else
        puts "I don't know what you meant, try again"
    end
  end
end

interactive_menu
