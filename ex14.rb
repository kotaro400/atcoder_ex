n, k = gets.split(" ").map(&:to_i)
heights = gets.split(" ").map(&:to_i)

ans = nil

(1..n - 1).to_a.combination(k - 1) do |buildings|
  amount = 0
  current_height= 0
  heights.each_with_index do |height, i|
    if buildings.include?(i)
      if current_height + 1 <= height
        current_height = heights[i]
      else
        amount += current_height + 1 - height
        current_height = current_height + 1
      end
    else
      current_height = height if height > current_height
    end
  end
  ans = amount if ans.nil? || amount < ans
end

puts ans