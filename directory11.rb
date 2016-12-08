@students = []
@collectnoun = "student#{'s' unless @students.count == 1}"


def print_menu
  puts "1. Input student details."
  puts "2. Show student details."
  puts "3. Save the list to students.csv"
  puts "9. Exit"
end

def process(selection)
  case selection
    when '1'
      input_students
    when '2'
      show_students
    when '3'
      save_students
    when '9'
      exit
    else
      puts "Not recognised. Try again."
    end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def input_students
  @cohort = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", 'Nov', "Dec"]
  puts "Please enter the names of the students and their cohort month"
  puts "To finish, just hit return twice"
  info = gets.chomp.split(',')
  while !info.empty? do # repeat until user hits return twice
    info[1] = info[1].gsub(/[\s,]/, "").capitalize
    info[1] = "Nov" if !@cohort.include?(info[1])
    @students << {:name => info[0], :cohort => info[1].capitalize} # push name and cohort to hash
    puts "Now we have #{@students.count} #{@collectnoun}."
    info = gets.chomp.split(',')
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

def show_students
  print_header
  print_students_list
  print_footer
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

interactive_menu
