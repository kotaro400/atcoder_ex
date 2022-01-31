n = gets.to_i
nodes = []
n.times.each do
  line = gets.split(" ").map(&:to_i)
  nodes << {
    id: line[0],
    degree: line[1],
    adj_node_ids: line[2..],
    distance: 0
  }
end

queue = [1]
seen = [false] * n
until queue.empty?
  node_id = queue.shift
  seen[node_id - 1] = true
  nodes[node_id - 1][:adj_node_ids].each do |adj_node_id|
    unless seen[adj_node_id - 1]
      queue.push(adj_node_id)
      current_distance = nodes[adj_node_id - 1][:distance]
      if current_distance == 0 || current_distance > nodes[node_id - 1][:distance] + 1
        nodes[adj_node_id - 1][:distance] = nodes[node_id - 1][:distance] + 1
      end
    end
  end
end

nodes.each do |node|
  puts "#{node[:id]} #{node[:distance]}"
end