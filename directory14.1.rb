@students = []
@collectnoun = "student#{'s' unless @students.count == 1}"


def print_menu
  puts "1. Input student details."
  puts "2. Show student details."
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv or give filename in command line."
  puts "9. Exit"
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
    when '1'
      input_students
    when '2'
      show_students
    when '3'
      save_students
    when '4'
      load_students
    when '9'
      exit
    else
      puts "Not recognised. Try again."
    end
end

def input_students
  @cohort = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", 'Nov', "Dec"]
  puts "Please enter the names of the students and their cohort month"
  puts "To finish, just hit return twice"
  info = STDIN.gets.chomp.split(',')
  while !info.empty? do # repeat until user hits return twice
    info[0].capitalize!
    info[1] = info[1].gsub(/[\s+]/, '').capitalize
    info[1] = "Nov" if !@cohort.include?(info[1])
    line = info.join(',')
    add_students(line) # push name and cohort to hash
    puts "Now we have #{@students.count} #{@collectnoun}."
    info = STDIN.gets.chomp.split(',')
  end
end

def print_header
  puts "The #{@collectnoun} of Villains Academy"
  puts "-------------"
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great #{@collectnoun}."
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    add_students(line)
  end
  file.close
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}."
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def show_students
  print_header
  print_students_list
  print_footer
end

def add_students(line)
  name, cohort = line.chomp.split(',')
  @students << {:name => name, :cohort => cohort.to_sym}
end
try_load_students
interactive_menu
