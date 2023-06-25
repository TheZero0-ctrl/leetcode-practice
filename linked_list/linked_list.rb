class LinkedList
  attr_accessor :head, :tail, :length

  def initialize(value)
    new_node = Node.new(value)
    @head = new_node
    @tail = new_node
    @length = 1
  end

  def print_list
    temp = head
    while temp
      puts temp.value
      temp = temp.next
    end
  end

  def append(value)
    new_node = Node.new(value)
    if @head
      @tail.next = new_node
      @tail = new_node
    else
      @tail = new_node
      @head = new_node
    end
    @length += 1
    true
  end

  def pop
    return if @length.zero?

    temp = @head
    pre = @head

    while temp.next
      pre = temp
      temp = temp.next
    end

    @tail = pre
    @tail.next = nil

    @length -= 1

    return temp unless @length.zero?

    @head = nil
    @tail = nil

    temp
  end

  def prepend(value)
    new_node = Node.new(value)
    new_node.next = @head
    @head = new_node
    @tail = new_node if @length.zero?
    @length += 1
    true
  end

  def shift
    return if @length.zero?

    temp = @head
    @head = temp.next
    temp.next = nil
    @tail = nil if @length == 1
    @length -= 1
    temp
  end

  def get(index)
    return if index >= @length || index.negative?

    temp = @head
    (0...index).each do |_i|
      temp = temp.next
    end
    temp
  end

  def set_value(index, value)
    temp = get(index)

    if temp
      temp.value = value
      true
    else
      false
    end
  end

  def insert(index, value)
    return if index >= @length || index.negative?

    return prepend(value) if index.zero?

    return append(value) if index == @length - 1

    temp = get(index - 1)

    new_node = Node.new(value)

    new_node.next = temp.next

    temp.next = new_node
    @length += 1
    true
  end

  def remove(index)
    return if index >= @length || index.negative?

    return shift if index.zero?

    return pop if index == @length - 1

    prev = get(index - 1)
    temp = prev.next
    prev.next = temp.next
    temp.next = nil
    @length -= 1

    temp
  end

  def reverse
    temp = @head
    @head = @tail
    @tail = temp
    after = temp.next
    before = nil

    (0...@length).each do |_i|
      after = temp.next
      temp.next = before
      before = temp
      temp = after
    end
  end

  # implementation of finding middle_node without using length
  def find_middle_node
    return unless @head

    fast = @head
    slow = @head

    while fast&.next
      fast = fast.next.next
      slow = slow.next
    end

    slow
  end

  # check if linked list has loop using Floyd's cycle-finding algorithm
  def loop?
    return false unless @head

    fast = @head
    slow = @head

    while fast&.next
      fast = fast.next.next
      slow = slow.next
      return true if fast == slow
    end

    false
  end

  # find kth from end of linked list without using length
  def find_kth_from_end(k)
    slow = @head
    fast = @head

    return if k.zero?

    (1...k).each do |_i|
      return nil unless fast

      fast = fast.next
    end

    while fast.next
      fast = fast.next
      slow = slow.next
    end

    slow
  end
end

class Node
  attr_accessor :value, :next

  def initialize(value)
    @value = value
    @next = nil
  end
end

