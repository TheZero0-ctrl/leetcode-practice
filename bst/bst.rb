class BinarySearchTree
  attr_accessor :root

  def initialize
    @root = nil
  end

  def insert(value)
    new_node = Node.new(value)
    @root = new_node if @root.nil?
    temp = @root
    loop do
      return false if temp.value == value

      if value < temp.value
        if temp.left.nil?
          temp.left = new_node
          return true
        else
          temp = temp.left
        end
      else
        if temp.right.nil?
          temp.right = new_node
          return true
        else
          temp = temp.right
        end
      end
    end
  end

  def contains?(value)
    temp = @root

    while temp
      if value < temp.value
        temp = temp.left
      elsif value > temp.value
        temp = temp.right
      else
        return true
      end
    end

    false
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    return nil if node.nil?

    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end

class Node
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end

binary_search_tree = BinarySearchTree.new
binary_search_tree.insert(10)
binary_search_tree.insert(5)
binary_search_tree.insert(15)
binary_search_tree.insert(3)
binary_search_tree.pretty_print
puts binary_search_tree.contains?(15)
puts binary_search_tree.contains?(2)
