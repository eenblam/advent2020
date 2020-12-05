def solve(map, x_shift, y_shift)
  width = map[0].length
  map.each_with_index
    .select{ |row, i| i % y_shift == 0 }
    .map {|row, i| row[ ((i / y_shift) * x_shift) % width  ] }
    .select{ |x| x == '#' }
    .count
end

def solve_product(map, shifts)
  shifts.map{ |xs,ys| solve(map, xs, ys) }.reduce(:*)
end

# Needed for both tests and solution
shifts = [[1,1], [3,1], [5,1], [7,1], [1,2]]

# Tests
test_data = IO.readlines('./testdata', chomp: true)
raise "Part 1 example failed" unless solve(test_data, 3, 1) == 7
raise "Part 2 example failed" unless solve_product(test_data, shifts) == 336

# Solutions
data = IO.readlines('./input', chomp: true)
# Problem 1
puts solve(data, 3, 1)
# Problem 2
puts solve_product(data, shifts)
