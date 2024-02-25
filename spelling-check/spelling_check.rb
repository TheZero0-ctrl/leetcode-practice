# We are given two string wher first string has one moer character.
# Our task is to check the number of wqys in which one character can be deleted
# to make the second string
# Input:
# The input is two lines, first line is the first string, second line is the second string
# Output:
# If there is no way to remove one character from the first string to get secon string, then output 0
# Otherwise, output two lines:
# On first line, output the number of ways to remove one character from the first string
# On second line, output space separated list of indices of the character that can be removed
# Example:
# Input
# abcdxxxefc
# abcdxxefb
# Output
# 3
# 5 6 7

def main
  first_string = gets.chomp
  second_string = gets.chomp

  prefix = prefix_length(first_string, second_string)
  suffix = suffix_length(first_string, second_string)

  total = (prefix + 1) - (first_string.length - suffix) + 1
  if total <= 0
    puts 0
  else
    puts total
    indexes = []
    (0...total).each do |i|
      indexes << (first_string.length - suffix) + i
    end
    puts indexes.join(' ')
  end
end

def prefix_length(first_string, second_string)
  prefix_length = 0
  first_string.chars.each_with_index do |char, index|
    break if char != second_string[index]

    prefix_length += 1
  end
  prefix_length
end

def suffix_length(first_string, second_string)
  suffix_length = 0
  first_string.chars.reverse.each_with_index do |char, index|
    break if char != second_string[second_string.length - 1 - index] || index > second_string.length - 1
    suffix_length += 1
  end
  suffix_length
end

main
