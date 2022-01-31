n, m = gets.split(" ").map(&:to_i)
rels = []
(n + 1).times.each { rels << [0] * (n + 1) }
m.times.each do
  rel = gets.split(" ").map(&:to_i)
  rels[rel[0]][rel[1]] = 1
  rels[rel[1]][rel[0]] = 1
end

ans = 0

[0, 1].repeated_permutation(n) do |bits|
  combination = (1..n).map {|i| i }.select {|i| bits[i - 1] == 1 }
  flag = true
  (0..combination.length - 1).each do |i|
    (i + 1..combination.length - 1).each do |j|
      member1 = combination[i]
      member2 = combination[j]
      flag = false if rels[member1][member2] == 0
    end
  end

  ans = combination.length if ans < combination.length && flag
end

puts ans 