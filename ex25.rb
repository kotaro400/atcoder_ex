w, h = gets.split(" ").map(&:to_i)
map = []
h.times.each { map << gets.split(" ").map(&:to_i)}

seen = []
h.times.each { seen << [false] * w }

def recursive_dfs(map, seen, row, col)
  h = map.length
  w = map[0].length
  seen[row][col] = true
  [-1, 0, 1].each do |row_dif|
    [-1, 0, 1].each do |col_dif|
      if row + row_dif >= 0 && row + row_dif < h && col + col_dif >= 0 && col + col_dif < w
        if map[row + row_dif][col + col_dif] == 1
          unless seen[row + row_dif][col + col_dif]
            recursive_dfs(map, seen, row + row_dif, col + col_dif)
          end
        end
      end
    end
  end
end

count = 0

h.times.each do |i|
  w.times.each do |j|
    next if map[i][j] == 0 || seen[i][j]
    recursive_dfs(map, seen, i, j)
    count += 1
  end
end

puts count