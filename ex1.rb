# input
n, x = gets.split(" ").map(&:to_i)

count = 0

(1..n).each do |i|
  (i + 1..n).each do |j|
    (j + 1..n).each do |k|
      count += 1 if i + j + k == x
    end
  end
end

# output
puts count