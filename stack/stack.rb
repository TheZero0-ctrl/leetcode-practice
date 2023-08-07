class Stack
  attr_accessor :top, :height
  def initialize(value)
    new_node = Node.new(value)
    @top = new_node
    @height = 1
  end

  def print_list
    temp = @top
    while temp
      puts temp.value
      temp = temp.next
    end
  end

  def push(value)
    new_node = Node.new(value)

    new_node.next = @top
    @top = new_node

    @height += 1
    true
  end

  def pop
    return nil if @height.zero?

    temp = @top
    @top = temp.next
    temp.next = nil
    @height -= 1
    temp
  end
end

class Node
  attr_accessor :value, :next
  def initialize(value)
    @value = value
    @next = nil
  end
end

stack = Stack.new(1)
stack.push(2)
stack.push(3)
stack.pop
stack.print_list
