n = gets.to_i
nodes = []
n.times.each do
  line = gets.split(" ").map(&:to_i)
  nodes << {
    id: line[0],
    degree: line[1],
    adjacent_node_ids: line[0] == 0 ? [] : line[2..2 + line[1] - 1]
  }
end

timestamps = []
n.times.each { timestamps << {
    discover: nil,
    finish: nil
  } 
}

stack = [1]
timestamps[0][:discover] = 1
time = 1

until stack.empty?
  time += 1
  node_id = stack.last
  node = nodes[node_id - 1]

  if node[:degree] == 0
    stack.pop
    timestamps[node_id - 1][:finish] = time
  end

  node[:adjacent_node_ids].each_with_index do |adjacent_node_id, idx|
    if timestamps[adjacent_node_id - 1][:discover].nil?
      timestamps[adjacent_node_id - 1][:discover] = time
      stack.push(adjacent_node_id)
      break      
    end

    if idx + 1 == node[:degree]
      stack.pop
      timestamps[node_id - 1][:finish] = time
    end
  end
end

timestamps.each_with_index do |timestamp, idx|
  puts "#{idx + 1} #{timestamp[:discover]} #{timestamp[:finish]}"
end

