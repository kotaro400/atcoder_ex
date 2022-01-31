n = gets.to_i
nums = gets.split(" ").map(&:to_i)
q = gets.to_i
queries = gets.split(" ").map(&:to_i)

queries.each do |query|
  flag = false
  [0, 1].repeated_permutation(n) do |bits|
    sum = nums.select.with_index {|num, i| bits[i] == 1 }.sum
    if sum == query
      flag = true
      puts "yes"
      break
    end
  end
  puts "no" unless flag
end

