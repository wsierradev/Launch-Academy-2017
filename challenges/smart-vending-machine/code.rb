#For this one I assumed you wanted all three parts incorporated into one file.
print "Hello, I'm the first and only Talking Vending Machine.\nWhat would you like today?\n>"
item = gets.chomp
print "How many of those would you like?\n>"
amount = gets.chomp
while amount.index("tons") == nil and amount.to_i <=0
  print "Invalid entry. Please enter a number.\n>"
  amount = gets.chomp
end
  while amount.index("tons") != nil
	  puts item
	number = rand(15)
	 if number == 0
	  break
	 end
	end
	amount.to_i.times do
	  puts item
	end
	puts "There you go!! Come again!!!"
