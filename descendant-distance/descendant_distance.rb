# We have a family tree and a distance value called 'd'. Each member in the tree
# gets a score based on how many descendants they have exactly 'd' edges away.
# Our task is to identify the members with the highest scores.

# Input:
# - First, we're given the number of test cases.
# - For each test case:
#   - We receive 'n', indicating the number of lines representing the tree structure,
#   and 'd', the distance value.
#   - Then, we're given 'n' lines to construct the tree. Each line contains a member's name,
#   followed by the count of their children ('m'), and then the names of their children.

# Example:
# 1
# 7 2
# John 1 Jake
# Lisa 1 Amy
# Bob 2 Peter John
# Jake 2 Mike Becky
# Chris 2 Will Sarah
# Amy 4 Tom Nick Sophie Chris
# Tom 1 Harry
#
# Output:
# For each test case, follow this format:

# Tree i:
# Here, 'i' represents the test case number.

# Then, list the names with high scores (number of descendants) in descending order.
# If there are ties, list the names alphabetically.

# Follow these rules:

# - If there are three or fewer names with high scores, list them all.
# - If there are more than three names with high scores, list the top three scores first.
# Then, list any other names with the same score as the third highest.

# For each listed name, show the name followed by its number of descendants.

# Separate the output for each test case with a blank line.

# For example, the output for a sample input is:

# Tree 1:
# Amber 5
# Zara 4
# Lucas 2

class Node
  attr_accessor :name, :children, :score

  def initialize(name)
    @name = name
    @children = []
    @score = 0
  end
end

def find_nodes(nodes, name)
  nodes.find { |node| node.name == name }
end

def read_tree(nodes, num_lines)
  num_nodes = 0
  (0...num_lines).each do |_i|
    line = gets.chomp.split(' ')
    parent_name = line[0]
    parent_node = find_nodes(nodes, parent_name)
    unless parent_node
      parent_node = Node.new(parent_name)
      nodes[num_nodes] = parent_node
      num_nodes += 1
    end

    (0...line[1].to_i).each do |j|
      child_node = find_nodes(nodes, line[j + 2])
      unless child_node
        child_node = Node.new(line[j + 2])
        nodes[num_nodes] = child_node
        num_nodes += 1
      end
      parent_node.children.push(child_node)
    end
  end
  num_nodes
end

def score_one(node, distance)
  return node.children.length if distance == 1

  total = 0
  node.children.each do |child|
    total += score_one(child, distance - 1)
  end
  total
end

def score_all(nodes, distance)
  nodes.each do |node|
    node.score = score_one(node, distance)
  end
end

def compare_nodes(a, b)
  if a.score == b.score
    a.name <=> b.name
  else
    b.score <=> a.score
  end
end

def sort_nodes(nodes)
  nodes.sort { |a, b| compare_nodes(a, b) }
end

def output_info(nodes, num_nodes)
  top_three = []
  (0...num_nodes).each do |i|
    if i < 3 && nodes[i].score.positive?
      top_three.push(nodes[i])
    elsif nodes[i].score == top_three[-1].score
      top_three.push(nodes[i])
    end
  end

  top_three.each do |node|
    puts "#{node.name} #{node.score}"
  end
end

def main
  num_cases = gets.chomp.to_i
  (0...num_cases).each do |i|
    nodes = []
    line = gets.chomp.split(' ')
    num_nodes = read_tree(nodes, line[0].to_i)
    score_all(nodes, line[1].to_i)
    nodes = sort_nodes(nodes)
    puts "Tree #{i + 1}:"
    output_info(nodes, num_nodes)
    puts if i + 1 < num_cases
  end
end

main
