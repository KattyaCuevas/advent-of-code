array = []

STDIN.each_line do |line|
  array = line.chomp.split(",").map(&:to_i)
end
pp array
results = []
number = 18
number.times do
  a = []
  new_element = 0
  array.each do |i|
    if i - 1 >= 0
      a << i - 1
    else
      a << 6
      new_element += 1
    end
  end
  new_element.times { a << 8 }
  array = a
  results << a
end

pp results.map(&:tally)
pp results.last.count