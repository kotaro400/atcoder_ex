n = gets.to_i
s = gets.chomp

count = 0
("000".."999").each do |pin|
  index = 0
  n.times.each do |i|
    index += 1 if s[i] == pin[index]
    break if index == 3
  end
  count += 1 if index == 3
end

puts count
