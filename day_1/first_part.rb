compare = nil
results = []

STDIN.each_line do |m|
  if compare
    results << (compare > m.to_i ? 'decreased' : 'increased')
  else
    results << 'N/A'
  end
  compare = m.to_i
end

pp results.count { |r| r == 'increased' }