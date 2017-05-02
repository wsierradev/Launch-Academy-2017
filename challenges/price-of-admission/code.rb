#Your code goes here!
adult_tix = 12.8
child_tix = 4

admission_total = adult_tix * 4 + child_tix * 2

puts "Your total comes to $#{admission_total.to_f}0"

split = admission_total / 4

puts "Split among the adults each will pay $#{split}0"
