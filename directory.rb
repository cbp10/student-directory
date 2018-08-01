require 'csv'

@students = []  # accessible to all methods
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp
  while !name.empty? do
    add_students(name)
    puts @students.count > 1? "Now we have #{@students.count} students" : "Now we have 1 student"
    name = STDIN.gets.chomp
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
  puts "3. Save the students"
  puts "4. Loads the students"
  puts "9. Exit"
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      puts "What file do you want these saved to?"
      save_students(STDIN.gets.chomp)
      puts "Saved"
    when "4"
      puts "What file do you want to load?"
      load_students(STDIN.gets.chomp)
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

def add_students(name, cohort = "november")
  @students << {name: name, cohort: cohort.to_sym}
end

def save_students(filename)
  CSV.open(filename, "wb") do |csv|
    @students.each do |student|
      csv << [student[:name], student[:cohort]]
   end
  end
end

def load_students (filename)
  CSV.read(filename).each do |line|
    name, cohort = line
    add_students(name, cohort)
   end
  puts "Loaded #{@students.count} from #{filename}"
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  filename = "students.csv" if filename.nil? 
  if File.exist?(filename)
    load_students filename
  else  # if file doesn't exist
    puts "Sorry #{filename} doesn't exist"
    exit
  end
end


def interactive_menu
  loop do
    # print menu and ask user what to do
    print_menu
    # do what user has asked
    process(STDIN.gets.chomp)
  end
end

try_load_students
interactive_menu
