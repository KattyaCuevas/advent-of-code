array = []

STDIN.each_line do |line|
  array << line.chomp
end

numbers = array.shift.chomp.split(",").map(&:to_i)
cards = []
card = []
array[1..-1].each do |line|
  next if line.empty?

  card << line.chomp.split(" ").map{|n| [n.to_i, '']}
  if card.length == 5
    cards << card
    card = []
  end
end

winners = []

# pp cards
numbers.each do |number|
  # pp number
  cards.each.with_index do |card, cidx|
    next unless card.flatten.include?(number)
    card.each.with_index do |line, lidx|
      next unless line.flatten.include?(number)
      cards[cidx][lidx][line.map(&:first).index(number)][1] = 'X'
    end
  end
  result = cards.map do |card|
    winner_line = []
    other_ones = []
    card.each do |line|
      result = line.map(&:last) === ['X', 'X', 'X', 'X', 'X']
      if result 
        winner_line = line.map(&:first)
      end
    end
    card.transpose.each do |line|
      result = line.map(&:last) === ['X', 'X', 'X', 'X', 'X']
      if result
        winner_line = line.map(&:first)
      end
    end
    if winner_line.any?
      winners << card
      winners.uniq!
      winner_line = [] if winners.length != cards.length
      other_ones = card.flatten(1).select { |_,mark| mark != 'X' }.map(&:first)
    end
    [winner_line, other_ones]
  end
  # pp result.any? { |r| r[0].any? }
  if result.any? { |line| line[0].any? }
    # pp result.detect { |line| line[0].any? }
    # pp result.detect { |line| line[0].any? }.map(&:first)
    # pp result.detect { |line| line[0].any? }.map(&:last)
    p number
    a = result.detect { |line| line[0].any? }[0].sum
    b = result.detect { |line| line[0].any? }[1].sum
    pp b * number
    break
  end
end
# pp cards