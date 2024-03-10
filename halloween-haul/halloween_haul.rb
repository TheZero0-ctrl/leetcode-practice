# We want to collect all the candy from a particular neighborhood as
# efficiently as possible. The neighborhood has a tree like structure
# Example neighborhood structure:
#                                     (  )
#
#                       (  )                     (  )
#
#             (  )              (  )      (7 )            (41)
#
#       (72)      ( 3)     ( 6)      (  )
#
#                              (  )        (   2)
#
#                      (  )         (15)
#
#                   ( 4)   ( 9)
# The circles with numbers in them are houses. Each number gives the amount of
# candy you’ll get by visiting that house. Candy values are at most two digits.
# The circle at the top is your starting location. The circles without numbers
# are intersections between streets, where you choose which way to walk next.
# The lines that connect circles are the streets. Moving from one circle to
# another corresponds to walking one street.”
# Your goal is to collect all of the candy and to do so by walking the minimum
# number of streets
# Input:
# The input consists of exactly five lines, where each line is a string of at
# most 255 characters that describes a neighborhood.
# Output:
# Output will be five lines of text, Each line of output contains two integers
# separated by a space: the minimum number of streets walked to obtain all of
# the candy and the total amount of candy obtained.

class Node
  attr_accessor :candy, :left, :right

  def initialize(candy = nil, left = nil, right = nil)
    @candy = candy
    @left = left
    @right = right
  end
end

class Stack
  attr_accessor :values, :highest_used

  def initialize
    @values = []
    @highest_used = -1
  end

  def push_stack(value)
    @highest_used += 1
    values[@highest_used] = value
  end

  def pop_stack
    @highest_used -= 1
    values.pop
  end

  def empty_stack?
    @highest_used == -1
  end
end

# way to recreate above sample neighborhood structure
# four = Node.new(4)
# nine = Node.new(9)
# intersection_1 = Node.new(left: four, right: nine)

# fifteen = Node.new(15)
# intersection_2 = Node.new(left: intersection_1, right: fifteen)

# use a stack to traverse the tree
def tree_candy_count_with_stack(tree)
  total = 0
  s = Stack.new
  while tree
    if tree.left && tree.right
      s.push_stack(tree.left)
      tree = tree.right
    else
      total += tree.candy
      tree = s.empty_stack? ? nil : s.pop_stack
    end
  end
  total
end

# use recursion
def tree_candy_count_with_recursion(tree)
  return tree.candy if tree.left.nil? && tree.right.nil?

  tree_candy_count_with_recursion(tree.left) + tree_candy_count_with_recursion(tree.right)
end

def tree_streets(tree)
  return 0 if tree.left.nil? && tree.right.nil?

  tree_streets(tree.left) + tree_streets(tree.right) + 4
end

def tree_height(tree)
  return 0 if tree.left.nil? && tree.right.nil?

  1 + [tree_height(tree.left), tree_height(tree.right)].max
end

def halloween_haul(tree)
  candies = tree_candy_count_with_recursion(tree)
  height = tree_height(tree)
  streets = tree_streets(tree) - height
  puts "#{streets} #{candies}"
end

def read_tree(line, position = 0)
  tree = Node.new
  if line[position] == '('
    position += 1
    tree.left, position = read_tree(line, position)
    position += 1
    tree.right, position = read_tree(line, position)
    position += 1
  else
    tree.candy = line[position].to_i
    position += 1
    if line[position] != ')' && line[position] != ' ' && !line[position].nil?
      tree.candy = tree.candy * 10 + line[position].to_i
      position += 1
    end
  end
  [tree, position]
end

def main
  5.times do
    line = gets.chomp
    tree = read_tree(line)[0]
    halloween_haul(tree)
  end
end

main
