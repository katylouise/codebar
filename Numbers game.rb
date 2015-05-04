puts "How many times would you like to play?"

number_of_turns = gets.to_i
number_of_turns ||= 5

turns = 0
correct = 0
incorrect = 0
start = Time.now

while turns < number_of_turns

	turns += 1
	x = Random.rand(0..10)

	y = Random.rand(0..10)

	puts "Add #{x} and #{y}"
	answer = gets.to_i

	if answer == x + y
		puts "Right!"
		correct += 1
	else
		puts "Wrong!"
		incorrect += 1
	end
end	

duration = (Time.now - start).round(2)
average_time_per_problem = duration.to_f / turns.to_f
percent_correct = correct.to_f / turns.to_f * 100
puts "You got #{correct} right and #{incorrect} wrong.  That is #{percent_correct}% correct.  Well done!"
puts "Total time #{duration} seconds."
puts "Your average time per problem is #{average_time_per_problem} seconds."

puts "Please enter your name:"
player_name = gets.chomp

filename = "scores.txt"
file = File.open(filename, 'a')
file.puts "#{player_name}, #{duration}"
file.close

scores = []

File.open('scores.txt', 'r') do |file|
	while line = file.gets
		scores << line.split(", ")
	end
end

puts "Fastest times:"
puts scores.collect(&:last)
		  	#i need to change each score into a float - otherwise is does not order correctly
		   .sort
		   .first(5)

# scores.collect do |score|
# 	score.last
# end

# scores.collect { |score| score.last }

