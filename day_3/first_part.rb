gamma_rate = ""
epsilon_rate = ""
array = []

STDIN.each_line do |line|
  array << line.split('')
end

(array.first.length - 1).times do |i|
  result = array.map { |x| x[i] }
  count = result.tally
  gamma_rate << count.max_by { |_, v| v }[0]
  epsilon_rate << count.min_by { |_, v| v }[0]
end

pp "gamma_rate: #{gamma_rate.to_i(2)}, epsilon_rate: #{epsilon_rate.to_i(2)}, result: #{gamma_rate.to_i(2) * epsilon_rate.to_i(2)}"
