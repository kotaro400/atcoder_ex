n = gets.to_i
s_arr = gets.split(" ").map(&:to_i)
q = gets.to_i
t_arr = gets.split(" ").map(&:to_i)

s_arr.sort!

count = 0

t_arr.each do |t|
  count += 1 if s_arr.bsearch {|i| i >= t } == t
end

puts count