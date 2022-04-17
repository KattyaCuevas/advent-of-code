gamma_rate = ""
epsilon_rate = ""
array = []
oxygen = ""
co2 = ""

STDIN.each_line do |line|
  array << line.split('').map(&:to_i)
end

valid_oxygen_numbers = array
valid_co2_numbers = array

(array.first.length - 1).times do |i|
  oxygen_result = valid_oxygen_numbers.map { |x| x[i] }
  oxygen_count = oxygen_result.tally
  oxygen << (oxygen_count[1] == oxygen_count[0] ? "1" : oxygen_count.max_by { |_k, v| v }[0].to_s)

  co2_result = valid_co2_numbers.map { |x| x[i] }
  co2_count = co2_result.tally
  co2 << (co2_count[1] == co2_count[0] ? "0" : co2_count.min_by { |_k, v| v }[0].to_s)

  valid_oxygen_numbers = valid_oxygen_numbers.filter { |x| x.join('').start_with? oxygen }
  valid_co2_numbers = valid_co2_numbers.filter { |x| x.join('').start_with? co2 }
end
p oxygen
p co2

# pp "gamma_rate: #{gamma_rate.to_i(2)}, epsilon_rate: #{epsilon_rate.to_i(2)}, result: #{gamma_rate.to_i(2) * epsilon_rate.to_i(2)}"
p "result: #{oxygen.to_i(2) * co2.to_i(2)}"
