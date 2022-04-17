array = []

STDIN.each_line do |line|
  array = line.chomp.split(",").map(&:to_i)
end
# pp array
# results = []
# count how many times each number appears
counted = array.tally
number = 256
number.times do
  new_hash = Hash.new(0)
  counted.each do |key, value|
    if key == 0
      new_hash[8] += value
      new_hash[6] += value
    else
      new_hash[key - 1] += value
    end 
  end
  counted = new_hash
end
pp counted.values.sum
pp array.join(',')