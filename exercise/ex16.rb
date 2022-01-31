n = gets.to_i
perm_p = gets.split(" ").map(&:to_i)
perm_q = gets.split(" ").map(&:to_i)

def greater_permutation(perm1, perm2)
  perm1.length.times.each do |i|
    return perm1 if perm1[i] > perm2[i]
    return perm2 if perm1[i] < perm2[i]
  end
end

if perm_p == perm_q
  puts 0; exit
end

ans = 0

(1..n).to_a.permutation do |perm|
  ans += 1 if greater_permutation(perm, perm_p) == perm && greater_permutation(perm, perm_q) == perm_q
  ans += 1 if greater_permutation(perm, perm_q) == perm && greater_permutation(perm, perm_p) == perm_p
end

puts ans + 1