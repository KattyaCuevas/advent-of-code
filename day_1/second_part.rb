lines = []

STDIN.each_line do |line|
  lines << line.to_i
end

meassurements = []
lines.each.with_index do |line, index|
  elements = [line]
  elements << lines[index + 1] unless lines[index + 1].nil?
  elements << lines[index + 2] unless lines[index + 2].nil?
  meassurements << elements.sum
end

results = []
compare = nil

meassurements.each do |m|
  if compare
    if compare == m
      results << 'no change'
    else
      results << (compare > m.to_i ? 'decreased' : 'increased')
    end
  else
    results << 'N/A'
  end
  compare = m
end
pp results.count { |r| r == 'increased' }