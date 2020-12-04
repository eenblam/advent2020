def validate_record(r)
	policy, password = r.split(': ')
	counts, target = policy.split
	min, max = counts.split('-').map {|x| x.to_i}
	n = password.count(target)
	(min <= n) and (n <= max)
end

puts IO.readlines('./input', chomp: true).select{|r| validate_record(r)}.count
