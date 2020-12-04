def validate_record(r)
	policy, password = r.split(': ')
	counts, target = policy.split
	min, max = counts.split('-').map {|x| x.to_i}
	n = password.count(target)
	(min <= n) and (n <= max)
end

def validate_record_by_index(r)
	policy, password = r.split(': ')
	indices, target = policy.split
	# Decrement index by 1 to account for 0-indexing
	i, j = indices.split('-').map {|x| x.to_i - 1}
	first, second = password[i] == target, password[j] == target
	(first or second) and not (first and second)
end

data = IO.readlines('./input', chomp: true)
puts data.select{|r| validate_record(r)}.count
puts data.select{|r| validate_record_by_index(r)}.count
