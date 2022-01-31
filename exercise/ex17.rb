k = gets.to_i
queens = []
k.times.each { queens << gets.split(" ").map(&:to_i) }

cells = []
8.times.each { cells << [0] * 8 }
8.times.each do |i| 
  8.times.each do |j| 
    queens.each do |queen| 
      if queen[0] == i || queen[1] == j || (queen[0] - i).abs == (queen[1] - j).abs
        cells[i][j] = 1
      else
        cells[i][j] = 0
      end
    end
  end
end

def feasible?(queens)
  8.times.each do |i|
    (i + 1..7).each do |j|
      if queens[i][0] == queens[j][0] || queens[i][1] == queens[j][1] || (queens[i][0] - queens[j][0]).abs == (queens[i][1] - queens[j][1]).abs
        return false
      end
    end
  end
  return true
end

cand_row = (0..7).to_a
queens.map {|queen| queen[0] }.each {|i| cand_row.delete(i) }

cand_col = (0..7).to_a
queens.map {|queen| queen[1] }.each {|i| cand_col.delete(i) }

cand_row.permutation do |perm|
  tmp_queens = Marshal.load(Marshal.dump(queens))
  (8 - k).times.each do |i|
    tmp_queens << [perm[i], cand_col[i]]
  end
  if feasible?(tmp_queens)
    8.times.each do |i|
      8.times.each do |j|
        if tmp_queens.include?([i, j])
          print "Q"
        else
          print "."
        end
      end
      print "\n"
    end
  end
end

