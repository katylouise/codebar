#!/usr/bin/env ruby

require 'pstore'

data = PStore.new("contacts.pstore")

# data.transaction do
# 	data["contacts"] = []
# end


run = true

while(run) do
	puts "Here are the options:"
	puts "Choose 1 to add a contact"
	puts "Choose 2 to retrieve a contact's birthday"
	puts "Choose 3 to list all contacts"
	puts "Choose 4 to delete a contact"
	puts "Choose 5 to exit"
	choice = gets.chomp

	case choice
	
	when '1'
		puts "Please enter the contact's name:"
		name = gets.chomp
		puts "Please enter the contact's birthday:"
		birthday = gets.chomp

		data.transaction do
			data["contacts"] << { name => birthday }
			data.commit
		end
	when '2'
		puts "Please enter the contact's name:"
		name = gets.chomp

		data.transaction do
			n = 0 
			data["contacts"].each do |contact| 
				if contact[name] 
					puts "#{contact[name]}"
					n = n + 1	
				end
			end
			puts "That contact does not exist." if n == 0
		end
	when '3'
		data.transaction do
			puts "#{data["contacts"]}"
		end

	when '4'
		puts "Which contact would you like to delete?"
		name = gets.chomp
		data.transaction do
			data["contacts"].each do |contact|
				if contact[name]
					data["contacts"].delete(contact)
				end
			end
		end
	when '5'
		run = false
	else
		puts "Please choose 1, 2, 3 or 4."
	end
end