def generate(num_rows)
  result = [[1]]
  return result if num_rows == 1

  (1..num_rows).each do |i|
    prev_row = [0] + result[-1] + [0]
    current_row = []
    (0..i).each do |j|
      puts j
      if prev_row[j + 1] && prev_row[j]
        current_row << prev_row[j] + prev_row[j + 1] 
        print current_row
      end
    end
    result << current_row
  end
  result
end

def combination(n, k)
  
end

def generate_math(num_rows)
  triangle = []
  (0..num_rows - 1).each do |n|
    row = []
    (0..n).each do |k|
      row << combination(n, k)
    end
    triangle << row
  end

  triangle
end

print generate_math(5)