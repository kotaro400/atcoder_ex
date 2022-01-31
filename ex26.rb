n, q = gets.split(" ").map(&:to_i)
nodes = []
n.times.each { nodes << {
  children_idxs: [],
  count: 0
} }
(n - 1).times.each do
  line = gets.split(" ").map(&:to_i)
  nodes[line[0] - 1][:children_idxs] << line[1]
  nodes[line[1] - 1][:children_idxs] << line[0]
end

queries = [0] * n
q.times.each do 
  line = gets.split(" ").map(&:to_i)
  queries[line[0] - 1] += line[1]
end

seen = [false] * n

def recursive_dfs(nodes, seen, queries, node_idx, count)
  return if seen[node_idx - 1]

  seen[node_idx - 1] = true
  nodes[node_idx - 1][:count] = count + queries[node_idx - 1]

  nodes[node_idx - 1][:children_idxs].each do |children_idx|
    recursive_dfs(nodes, seen, queries, children_idx, nodes[node_idx - 1][:count])
  end
end

recursive_dfs(nodes, seen, queries, 1, 0)

puts nodes.map {|node| node[:count] }.join(" ")



