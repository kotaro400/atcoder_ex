# input
s = gets.chomp

ans = 0

(0..s.length - 1).each do |i|
  (i..s.length - 1).each do |j|
    sub_string = s[i..j]
    ans = sub_string.length  if sub_string.split("").all? {|s| ["A", "C", "G", "T"].include?(s) } && ans < sub_string.length
  end
end

# output
puts ans