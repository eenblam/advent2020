def count_union(filename)
  IO.read(filename)
    .split(%r{\n\n})
    .map{ |x| x.gsub(/\s+/, "").chars.uniq.count }
    .sum
end

def count_intersection(filename)
  IO.read(filename)
    .split(%r{\n\n})
    .map{ |x| x.split(%r{\n}).map(&:chars).reduce(&:intersection).count }
    .sum
end

raise "Part 1 test fail" unless count_union('./testdata') == 11
raise "Part 2 test fail" unless count_intersection('./testdata') == 6

puts count_union('./input')
puts count_intersection('./input')
