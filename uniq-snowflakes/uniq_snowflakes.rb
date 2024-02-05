#   we will be given collection of snowflakes, we have to determine whether any two snowflakes are identical
#   snowflake is represented by six integers, where each integer represents length of one of snowflake arms
#   snowflakes are considered identical in following conditions
#   1, 2, 3, 4, 5, 6 and 1, 2, 3, 4, 5, 6 is identical
#   1, 2, 3, 4, 5, 6 and 4, 5, 6, 1, 2, 3 is identical
#   1, 2, 3, 4, 5, 6 and 3, 2, 1, 6, 5, 4 is identical
#   input will be:
#   first line will be number of snowflakes -> Node
#   remaining lines will be snowflakes

class SnowflakeNode
  attr_accessor :snowflake, :next_node

  def initialize(snowflake, next_node)
    @snowflake = snowflake
    @next_node = next_node
  end
end
SIZE = 100_000

def identify_identical(values)
  values.each do |node|
    node1 = node
    while node1
      node2 = node1.next_node
      while node2
        if are_identical?(node1.snowflake, node2.snowflake)
          puts 'Twin snowflakes found.'
          return nil
        end
        node2 = node2.next_node
      end
      node1 = node1.next_node
    end
  end
  puts 'No two snowflakes are alike.'
end

def identical_right?(snow1, snow2, start)
  (0...6).each do |i|
    return false if snow1[i] != snow2[(start + i) % 6]
  end
  true
end

def identical_left?(snow1, snow2, start)
  (0...6).each do |i|
    snow2_index = start - i
    snow2_index += 6 if snow2_index.negative?
    return false if snow1[i] != snow2[snow2_index]
  end
  true
end

def are_identical?(snow1, snow2)
  (0...6).each do |i|
    return true if identical_right?(snow1, snow2, i) || identical_left?(snow1, snow2, i)
  end
  false
end

def code(snowflake)
  (snowflake[0] + snowflake[1] + snowflake[2] + snowflake[3] + snowflake[4] + snowflake[5]) % SIZE
end

def main
  n = gets.chomp.to_i
  snowflakes = Array.new(SIZE)
  (1..n).each do
    snowflake = gets.chomp.split(' ').map(&:to_i)
    code = code(snowflake)
    snowflake_node = SnowflakeNode.new(snowflake, snowflakes[code])
    snowflakes[code] = snowflake_node
  end

  identify_identical(snowflakes)
end

main
