x, y = 0, 0

STDIN.each_line do |line|
  command, units = line.split(' ')
  if command == 'forward'
    x += units.to_i
  elsif['down', 'up'].include? command
    y += units.to_i if command == 'down'
    y -= units.to_i if command == 'up'
  end
end
pp "x: #{x}, y: #{y}, result: #{x * y}"
