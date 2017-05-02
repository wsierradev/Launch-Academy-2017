# Wasn't sure if I was allowed to use arrays for this one as the array lesson was below this one but it seemed like the simplest way to complete this one.
beer = 99
tens = ['10', '20', '30', '40', '50', '60', '70', '80', '90']
more_than_one = "s"
while beer != "no more"
  if tens[-1] == beer.to_s
    punctuation = "!"
    tens.pop
  else
	    punctuation = "."
	  end
	    puts "#{beer} bottle#{more_than_one} of beer on the wall, #{beer} bottle#{more_than_one} of beer#{punctuation}"
	    beer -= 1
	    if beer == 1
	      more_than_one = ""
	    end
	  unless beer != 0
	    beer = "no more"
	    more_than_one = "s"
	  end
	  puts "Take one down and pass it around, #{beer} bottle#{more_than_one} of beer on the wall.\n\n"
	end

	puts "No more bottles of beer on the wall, no more bottles of beer."
	puts "Go to the store and buy some more, 99 bottles of beer on the wall."
