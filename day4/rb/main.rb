def run(filename)
  IO.read(filename)
    .split(%r{\n\n})
    .map{|raw| process raw}
    .select{|record| is_complete record}
end

def process(raw)
  d = {}
  raw.split.each do |chunk|
    k,v = chunk.split ':'
    d[k] = v
  end
  d
end

def is_complete(record)
  # Just dropped 'cid'
  fields = ['byr', 'iyr', 'eyr', 'hgt', 'hcl', 'ecl', 'pid']
  fields.each do |field|
    record.has_key? field or return false
  end
  return true
end

raise "Part 1 test fail" unless run('./testdata').count == 2

# Part 2 looks straightfoward but tedious. I'll come back to it.

puts run('./input').select{|x| x}.count
