@students = []
@collectnoun = "student#{'s' unless @students.count == 1}"

def input_students
  @cohort = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", 'Nov', "Dec"]
  puts "Please enter the names of the students and their cohort month"
  puts "To finish, just hit return twice"
  info = gets.gsub(/\s/, "").split(',') # get info, remove excess whitespace and split into usable chunks
  while !info.empty? do # repeat until user hits return twice
    info.each { |x| x.gsub!(/[\s,]/ , "") } # get rid of spare whitespace and commas
    info[1] = "Nov" if !@cohort.include?(info[1].to_s.capitalize) # if cohort doesn't match any in array revert to default
    @students << {name: info[0].capitalize.to_sym, cohort: info[1].capitalize.to_sym} # push name and cohort to hash
    puts "Now we have #{@students.count} #{@collectnoun}."
    # get another name from the user
    info = gets.gsub(/\s/, "").split(',')
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input student details."
  puts "2. Show student details."
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
    when '1'
      input_students
    when '2'
      show_students
    when '9'
      exit
    else
      puts "Not recognised. Try again."
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

interactive_menu
