m = gets.to_i
obj = []
m.times.each {|i| obj << gets.split(" ").map(&:to_i) }
n = gets.to_i
stars = []
n.times.each {|i| stars << gets.split(" ").map(&:to_i) }

stars.sort! {|a, b| a[0] * 10 + a[1] <=>  b[0] * 10 + b[1] }

def exist_star?(stars, star)
  stars.bsearch {|i| i[0] * 10 + i[1] >=  star[0] * 10 + star[1] } == star
end

stars.each do |star|
  x_diff = star[0] - obj[0][0]
  y_diff = star[1] - obj[0][1]

  count = 0

  (1..m - 1).each do |i|
    if exist_star?(stars, [obj[i][0] + x_diff, obj[i][1] + y_diff])
      count += 1
    else
      break
    end
  end
  if count == m - 1
    puts "#{x_diff} #{y_diff}"
    exit
  end
end


