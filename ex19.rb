d = gets.to_i
n = gets.to_i
m = gets.to_i
stores = [0, d]
(n - 1).times.each { stores << gets.to_i }
customers = []
m.times.each { customers << gets.to_i }

stores.sort!

sum = 0

customers.each do |customer|
  index = stores.bsearch_index {|store| store >= customer }
  min = [(customer - stores[index]).abs, (customer - stores[index - 1]).abs].min
  sum += min
end

puts sum