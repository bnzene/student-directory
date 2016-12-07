def input_students
  puts "Please enter the names of the students and the first 3 letters of their cohort month, separated by a comma and a space:"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  details = gets.chomp.split(', ')
  cohorts = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
  while !details.empty? do
    if !cohorts.include?((details[1]).to_s.capitalize!) # if user enters nothing or a non-existent cohort (i.e. not in array)
      details[1] = "Nov" # set details[1] to default value - cohort defaults to November
    end
    students << {name: details[0].capitalize.to_sym, cohort: details[1].capitalize.to_sym} # default cohort value 'november'; convert string input to symbol
    puts "Now we have #{students.count} students"
    details = gets.chomp.split(', ')
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each_with_index {|student, n|  puts "#{n+1}: #{student[:name]}, (#{student[:cohort]} cohort)"}
end

# finally, we print the total
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

# nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
