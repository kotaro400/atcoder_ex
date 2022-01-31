n = gets.to_i
a = gets.split(" ").map(&:to_i)
b = gets.split(" ").map(&:to_i)
c = gets.split(" ").map(&:to_i)

b.sort!
c.sort!

count = 0

a.each do |top|
  idx = b.bsearch_index {|mid| mid >= top }
  next if idx.nil?
  idx += 1 if b[idx] == top 
  next if idx == n
  (idx..n - 1).each do |i|
    mid = b[i]
    idx = c.bsearch_index {|bottom| bottom >= mid }
    next if idx.nil?
    idx += 1 if c[idx] == mid 
    next if idx == n
    count += n - idx
  end
end

puts count
