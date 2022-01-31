a, b, c, x, y = gets.split(" ").map(&:to_i)

ans = 0

if a + b <= 2 * c
  ans = a * x + b * y
else
  if x < y
    ans = b <= 2 * c ? x * 2 * c + (y - x) * b : y * 2 * c
  else
    ans = a <= 2 * c ? y * 2 * c + (x - y) * a : x * 2 * c
  end
end

puts ans