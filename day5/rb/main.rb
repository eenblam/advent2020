def find_seat(s)
	row = s[0..6].gsub('F', '0').gsub('B', '1').to_i(2)
	seat = s[7..9].gsub('L', '0').gsub('R', '1').to_i(2)
	id = row * 8 + seat
	return row, seat, id
end

raise "Part 1 test 1 failed" unless find_seat('FBFBBFFRLR') == [44, 5, 357]
raise "Part 1 test 2 failed" unless find_seat('BFFFBBFRRR') == [70, 7, 567]
raise "Part 1 test 3 failed" unless find_seat('FFFBBBFRRR') == [14, 7, 119]
raise "Part 1 test 4 failed" unless find_seat('BBFFBBFRLL') == [102, 4, 820]

passes = IO.readlines('./input', chomp: true)
# Part 1
puts passes.map{|pass| find_seat(pass)[2]}.max

# Part 2
seats = passes.map{|pass| find_seat(pass)}.map(&:last).sort
seats.each_with_index do |seat, i|
	# Assume well-behaved inputs, i.e. we'll complete before indexing out of bounds
	next_seat = seats[i+1]
	if next_seat - seat == 2
		puts seat + 1
		exit
	end
end
