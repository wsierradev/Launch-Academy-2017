('a'..'j').each do |letter|
  (1..10).each do |i|
     print @board["#{letter}#{i}"]
  end
  puts  # end the line
end
