require 'csv'
@cohort = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", 'Nov', "Dec"]
@students = []
@collectnoun = "student#{'s' unless @students.count == 1}"
# create input method/variable? @input = STDIN.gets.chomp - can you have a globally-accessible but locally-editable variable?
def print_menu
  puts "1. Input student details."
  puts "2. Show student details."
  puts "3. Save list to students.csv, or give new filename in command line."
  puts "4. Load list from students.csv or give new filename in command line."
  puts "9. Exit"
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def input_filename
  puts "Enter a filename. Default name is students.csv."
  @filename = STDIN.gets.chomp.to_s
  @filename = 'students.csv' if @filename == '' || !File.exists?(@filename.to_s)
end

def process(selection)
  choices = ['1', '2', '3', '4', '9']
  input_students                    if selection == '1'
  show_students                     if selection == '2'
  save_students(input_filename)     if selection == '3'
  load_students(input_filename)     if selection == '4'
  exit                              if selection == '9'
  puts "Not recognised. Try again." if !choices.include?(selection)
end

def input_students
  puts "Please enter the names of the students and their cohort month separated by a comma. To finish, just hit return twice."
  info = STDIN.gets.chomp.split(',')
  while !info.empty? do
    info[0] = info[0].split(' ').each {|x| x.capitalize}.join(' ')
    info[1] = info[1].to_s.gsub(/[\s+]/, '').capitalize
    info[1] = "Nov" if !@cohort.include?(info[1])
    add_students(info) # push name and cohort to hash
    puts "Successfully added student #{info[0]}. Now we have #{@students.count} #{@collectnoun}."
    info = STDIN.gets.chomp.split(',')
  end
end

def print_header
  puts "The #{@collectnoun} of Villains Academy"
  puts "-------------"
end

def print_students_list
  @students.each do |student, cohort|
    puts "#{student}, #{cohort}"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great #{@collectnoun}."
end

def save_students(filename)
  CSV.open(@filename, "w") do |csv|
    @students.each do |student|
      student.join(',')
      csv << student
    end
  end
  puts "Successfully saved to #{@filename}."
end

def load_students(filename)
  @students.clear # empty students array before opening new file - avoids printing duplicates
  CSV.foreach("#{@filename}") { |row| add_students(row) }
  puts "Successfully loaded #{@filename}."
end

def try_load_students
  @filename = ARGV.first.to_s
  @filename = 'students.csv' unless File.exists?(@filename.to_s)
  load_students(@filename)
  puts "Loaded #{@filename}.#{" #{ARGV.first} not found." if !File.exists?(ARGV.first.to_s) && !ARGV.first.nil?}"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def add_students(line)
  @students << line
end
try_load_students
interactive_menu

# add print_by_cohort functionality
