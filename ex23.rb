n, m = gets.split(" ").map(&:to_i)
points = [0]
n.times.each { points << gets.to_i }

twice_points = []
points.each do |point_1|
  points.each do |point_2|
    twice_points << point_1 + point_2
  end
end

twice_points.sort!.reverse!

ans = 0

twice_points.each do |point_1|
  point_2 = twice_points.bsearch {|twice_point| point_1 + twice_point <= m }
  ans = point_1 + point_2 if point_2 && ans < point_1 + point_2
end

puts ans