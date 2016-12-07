def input_students
  puts "Please enter the names of the students, their favourite hobby, country of birth and height in cm separated by a comma and a space:"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  details = gets.chomp.split(', ')
  while !details.empty? do
    students << {name: details[0], hobby: details[1], country: details[2], height: details[3], cohort: :november} # push contents of details into students as sub-hashes
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
  students.each_with_index {|student, n|  puts "#{n+1}: #{student[:name]}, hobby: #{student[:hobby]}, country of birth: #{student[:country]}, height: #{student[:height]} (#{student[:cohort]} cohort)"}
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
