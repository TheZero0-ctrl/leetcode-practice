class Queue
  attr_accessor :first, :last, :length

  def initialize(value)
    new_node = Node.new(value)
    @first = new_node
    @last = new_node
    @length = 1
  end

  def print_list
    temp = @first

    while temp
      puts temp.value
      temp = temp.next
    end
  end

  def enqueue(value)
    new_node = Node.new(value)
    @last.next = new_node
    @last = new_node
    @first = new_node if @length.zero?
    @length += 1
    true
  end

  def dequeue
    return nil if @length.zero?

    temp = @first
    @first = temp.next
    @length -= 1
    @last = nil if @length.zero?
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

queue = Queue.new(1)
queue.enqueue(2)
queue.dequeue
queue.print_list