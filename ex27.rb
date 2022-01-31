m = gets.to_i
n = gets.to_i
map = []
n.times.each { map << gets.split(" ").map(&:to_i) }

max = 0
seen = []
n.times.each { seen << [false] * m }

def recursive_dfs(map, seen, y, x, dist)
  return dist if seen[y][x]

  m = map[0].length
  n = map.length

  seen[y][x] = true

  cand_list = [
    {x: x + 1, y: y},
    {x: x - 1, y: y},
    {x: x, y: y + 1},
    {x: x, y: y - 1},
  ]

  max = 0

  cand_list.each do |cand|
    if cand[:x] >= 0 && cand[:x] < m && cand[:y] >= 0 && cand[:y] < n && map[cand[:y]][cand[:x]] == 1
      tmp = recursive_dfs(map, seen, cand[:y], cand[:x], dist + 1)
      max = tmp if tmp > max
    end
  end

  seen[y][x] = false

  return max
end

n.times.each do |i|
  m.times.each do |j|
    if map[i][j] == 1
      tmp = recursive_dfs(map, seen, i, j, 0)
      max = tmp if tmp > max
    end
  end
end

puts max