n = gets.to_i
locations = []
n.times.each { locations << gets.split(" ").map(&:to_i) }

def get_distance(loc1, loc2)
  Math.sqrt((loc1[0] - loc2[0]) ** 2 + (loc1[1] - loc2[1]) ** 2)
end

sum = 0

locations.each do |loc1|
  locations.each do |loc2|
    sum += get_distance(loc1, loc2) * (1..n - 1).inject(:*)
  end
end

puts sum / (1..n).inject(:*)