require 'set'

nums = IO.readlines('./input', chomp: true).map { |s| s.to_i }
ds = Set[]

# Both solutions assume only one result (identifies first)

# Product of two inputs summing to 2020
nums.each do |num|
    diff = 2020 - num
    if ds.include?(num)
      puts num * diff
      break
    end
    ds.add(diff)
end

# Product of three inputs summing to 2020
# There's probably a more optimized algorithm, but...
puts nums.combination(3).select {|x,y,z| x+y+z == 2020}[0].reduce {|x,y| x*y}
