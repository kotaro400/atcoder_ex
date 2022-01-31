n = gets.to_i
customers = []
n.times.each {|i| customers << gets.split(" ").map(&:to_i) }
a_customers = customers.map {|customer| customer[0] }
b_customers = customers.map {|customer| customer[1] }

start = a_customers.sort[n / 2]
goal = b_customers.sort[n / 2]

ans = 0

a_customers.each {|a| ans += (a - start).abs }
customers.each {|c| ans += (c[0] - c[1]).abs }
b_customers.each {|b| ans += (b - goal).abs }

puts ans

