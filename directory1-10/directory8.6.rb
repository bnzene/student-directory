def input_students
  puts "Please enter the names of the students, their favourite hobby and country of birth separated by a comma and a space:"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  details = gets.chomp.split(', ')
  while !details.empty? do
    students << {name: details[0], hobby: details[1], country: details[2], cohort: :november}
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
  line_width = 80
  students.each_with_index { |student, n| puts "#{n+1}: #{student[:name]} ".ljust(line_width/4) + "hobby: #{student[:hobby]} ".ljust(line_width/4) + "country of birth: #{student[:country]} ".ljust(line_width/4) + "(#{student[:cohort]} cohort)".rjust(line_width/4)}
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
# set line_width = 80, say
# line_width / 4
# puts each detail, left aligned, center, center, right-aligned(line_width/4)
