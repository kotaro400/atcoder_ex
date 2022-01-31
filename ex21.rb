n = gets.to_i
heights = []
speeds = []
n.times.each do
  line = gets.split(" ").map(&:to_i)
  heights << line[0]
  speeds << line[1]
end

max = heights.max + speeds.max * n

ans = (0..max).bsearch do |score|
  limits = n.times.map {|i| (score - heights[i]) / speeds[i] }
  sorted_limits = limits.sort
  sorted_limits.map.with_index.all? {|limit, i| limit >= i }
end

puts ans