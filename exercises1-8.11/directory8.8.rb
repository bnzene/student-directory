def input_students
  puts "Please enter the names of the students and the first 3 letters of their cohort month, separated by a comma and a space:"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  details = gets.chomp.split(', ') # get info and split into usable chunks
  @cohorts = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"] # array of possible cohorts
  while !details.empty? do # repeat until user hits return twice
    if !@cohorts.include?(details[1].to_s.capitalize) # if user enters nothing or a non-existent cohort (i.e. not in array)
      details[1] = "Nov" # set cohort name to default value of November
    end
    students << {name: details[0].capitalize.to_sym, cohort: details[1].capitalize.to_sym} # convert string input in each subarray to symbols and push to hash 'students'
    puts "Now we have #{students.count} students"
    details = gets.chomp.split(', ') # ask for more input until loop breaks
  end
  students # return the array of students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students) # print in order of entry
  students.each_with_index {|student, n|  puts "#{n+1}: #{student[:name]}, (#{student[:cohort]} cohort)"}
end

def print_by_cohort(students) # print by cohort
  puts "Print all students by month with 'A', or select month with 'S':"
  option = gets.chomp.upcase
  while option != ''
    if option == 'A'
      @cohorts.each do |cohort|
      students.each_with_index {|student, n|  puts "#{n+1}: #{student[:name]} (#{student[:cohort]} cohort)" if "#{student[:cohort]}".casecmp(cohort) == 0 }
      end
    elsif option == 'S'
      puts "Type in cohort name:"
      name = gets.chomp.capitalize
      students.each_with_index {|student, n|  puts "#{n+1}: #{student[:name]} (#{student[:cohort]} cohort)" if "#{student[:cohort]}" == name }
    else
      puts "Option not recognised."
    end
    puts "Print another cohort ('S'), all students ('A'), or press enter to exit."
    option = gets.chomp.upcase
  end
end

# finally, we print the total
def print_footer(names)
  puts "Overall, we have #{names.count} great students."
end

# nothing happens until we call the methods
students = input_students
print_header
print_by_cohort(students)
print_footer(students)

# iterate over array of cohorts and print :cohort " cohort" + all students whose value for cohort matches
# pick months with gets.chomp
