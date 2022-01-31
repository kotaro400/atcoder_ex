n, m = gets.split(" ").map(&:to_i)
s_arr = []
m.times.each { s_arr << gets.split(" ").map(&:to_i)[1..] }
p_arr = gets.split(" ").map(&:to_i)

count = 0

[0, 1].repeated_permutation(n) do |bits|
  count += 1 if m.times.all? {|i| s_arr[i].select {|s| bits[s - 1] == 1 }.length % 2 == p_arr[i] }
end

puts count