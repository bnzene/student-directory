def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each_with_index {|student, n|  puts "#{n+1}: #{student[:name]} (#{student[:cohort]} cohort)"}
end

def ask(students)
  def print_with_letter(students)
    m = 0
    letter = gets.chomp.downcase # create variable letter equal to user's input
    students.each_with_index do |student, n|
      if (student[:name])[0].downcase == letter
        puts "#{n+1}: #{student[:name]}, #{student[:cohort]}"
        m += 1
      end
    end
    if m == 0
      puts "There are no students whose names begin with #{letter}."
    end
    print_footer(students)
  end

  puts "What letter would you like to filter names by? Calling print_with_letter now..."
  print_with_letter(students)
  puts "Would you like to filter by another letter? Enter 'Y' for yes or hit any key to exit."
  ask(students) if gets.chomp.upcase == 'Y'
  else exit
end

# finally, we print the total
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

# nothing happens until we call the methods
students = input_students
print_header
ask(students)
