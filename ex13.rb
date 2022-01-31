r, c = gets.split(" ").map(&:to_i)
state = []
r.times.each { state << gets.split(" ").map(&:to_i) }

ans = 0

[0, 1].repeated_permutation(r) do |bits|
  temp_state = state.map.with_index {|row, i| row.map {|s| bits[i] == 1 ? (s - 1).abs : s } }
  count = 0
  c.times.each do |i|
    front_count = r.times.map {|j| temp_state[j][i] }.count(1)
    back_count = r - front_count
    count += [front_count, back_count].max
  end
  ans = count if ans < count
end

puts ans