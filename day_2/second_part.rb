position, depth, aim = 0, 0, 0

STDIN.each_line do |line|
  command, units = line.split(' ')
  if command == 'forward'
    position += units.to_i
    depth += units.to_i * aim
  elsif['down', 'up'].include? command
    aim += units.to_i if command == 'down'
    aim -= units.to_i if command == 'up'
  end
  pp "position: #{position}, depth: #{depth}, aim: #{aim}"  
end
pp "position: #{position}, depth: #{depth}, result: #{position * depth}"
