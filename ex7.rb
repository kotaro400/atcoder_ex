n = gets.to_i
pillars = []
n.times.each {|i| pillars << gets.split(" ").map(&:to_i) }

pillars.sort! {|a, b| a[0] * 10 + a[1] <=>  b[0] * 10 + b[1] }

def exist_pillar?(pillars, pillar)
  pillars.bsearch {|i| i[0] * 10 + i[1] >=  pillar[0] * 10 + pillar[1] }
end

max_area = 0

pillars.each do |pillar_1|
  pillars.each do |pillar_2|
    pillar_3_x = pillar_1[0] - (pillar_1[1] - pillar_2[1])
    pillar_3_y = pillar_1[1] - (pillar_2[0] - pillar_1[0])
    pillar_4_x = pillar_3_x + (pillar_2[0] - pillar_1[0])
    pillar_4_y = pillar_3_y + (pillar_2[1] - pillar_1[1])
    pillar_3 = [pillar_3_x, pillar_3_y]
    pillar_4 = [pillar_4_x, pillar_4_y]

    if exist_pillar?(pillars, pillar_3) == pillar_3 && exist_pillar?(pillars, pillar_4) == pillar_4
      area = (pillar_1[0] - pillar_2[0]).abs ** 2 + (pillar_1[1] - pillar_2[1]).abs ** 2
      max_area = area if area > max_area
    end
  end
end

puts max_area