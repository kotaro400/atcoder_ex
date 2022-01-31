# input 
n = gets.to_i

ans = 0

1.step(n, 2) do |i|
  count = 0
  (1..n).each do |j|
    count += 1 if i % j == 0
  end
  ans += 1 if count == 8
end

# output
puts ans