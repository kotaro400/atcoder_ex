n, m = gets.split(" ").map(&:to_i)
a_array = []
n.times.each do
  a_array << gets.split(" ").map(&:to_i)
end

ans = 0

m.times.each do |i|
  (i..m - 1).each do |j|
    score = 0
    n.times.each do |k|
      score += [a_array[k][i], a_array[k][j]].max
    end
    ans = score if ans < score
  end
end

puts ans