=begin
  n -> line of people
  m -> number of new people
  each m number of people will join shortest line
  return number of people in each line that each person will join
  example:
  input:
  3 4 => n, m
  3 2 5 => number of people in each line
=end

def food_lines(n, m, lines)
  (1..m).each do |_i|
    shortest = shortest_line(lines, n)
    puts lines[shortest]
    lines[shortest] += 1
  end
end

def shortest_line(lines, n)
  shortest = 0
  (1..n - 1).each do |i|
    shortest = i if lines[i] < lines[shortest]
  end
  shortest
end

def main
  n, m = gets.chomp.split.map(&:to_i)
  lines = gets.chomp.split.map(&:to_i)
  food_lines(n, m, lines)
end

main
