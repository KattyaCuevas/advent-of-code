def is_diagonal?(coor1, coor2)
  # calculate if the coordinates are diagonal
  (coor1[0] - coor2[0]).abs == (coor1[1] - coor2[1]).abs
end

array = []

STDIN.each_line do |line|
  array << line.chomp.split(" -> ").map { |coor| coor.split(',').map(&:to_i) }
end
# pp array
pp array.map { |coor| coor.map(&:first) }.flatten.min
pp array.map { |coor| coor.map(&:last) }.flatten.max
initial = array.map { |coor| coor.map(&:first) }.flatten.min
finish = array.map { |coor| coor.map(&:last) }.flatten.max
# p initial, finish

result = Array.new(finish + 1).map { |_| Array.new(finish + 1, '.') }
# pp result.map { |row| row.join('') }
array.each do |coor1, coor2|
  if coor1[0] == coor2[0]
    coor1[1] > coor2[1] ? (coor1, coor2 = coor2, coor1) : nil
    (coor1[1]..coor2[1]).each do |i|
      # p i, coor1[0]
      result[i][coor1[0]] = result[i][coor1[0]] == '.' ? 1 : result[i][coor1[0]] + 1
    end
  elsif coor1[1] == coor2[1]
    coor1[0] > coor2[0] ? (coor1, coor2 = coor2, coor1) : nil
    # p (coor1[0]..coor2[0]).to_a
    (coor1[0]..coor2[0]).each do |i|
      result[coor1[1]][i] = result[coor1[1]][i] == '.' ? 1 : result[coor1[1]][i] + 1
    end
  elsif is_diagonal?(coor1, coor2)
    # pp [coor1, coor2]
    # coor1[0] > coor2[0] ? (coor1, coor2 = coor2, coor1) : nil
    # coor1[1] > coor2[1] ? (coor1, coor2 = coor2, coor1) : nil
    # mark all the diagonal points
    (coor1[0] > coor2[0] ? coor1[0].downto(coor2[0]) : (coor1[0]..coor2[0])).each do |i|
      (coor1[1] > coor2[1] ? coor1[1].downto(coor2[1]) : (coor1[1]..coor2[1])).each do |j|
        # pp '?', [i, j]
        if is_diagonal?([i,j], coor1)
          # pp 'X', [i, j]
          result[j][i] = result[j][i] == '.' ? 1 : result[j][i] + 1
        end
      end
    end
  end
end
pp result.map(&:join)
pp result.flatten.count { |i| i != '.' && i > 1 }