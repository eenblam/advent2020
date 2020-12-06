def run(filename)
  IO.read(filename)
    .split(%r{\n\n})
    .map{ |x| x.gsub(/\s+/, "").chars.uniq.count }
    .sum
end

raise "Part 1 test fail" unless run('./testdata') == 11

puts run('./input')
