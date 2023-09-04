def unique_paths_2d(m, n)
  dp = Array.new(m) { |i| Array.new(n) { |j| i.zero? || j.zero? ? 1 : 0 } }

  (1..m).each do |i|
    (1..n).each do |j|
      dp[i][j] = dp[i - 1][j] + dp[i][j - 1]
    end
  end

  dp[-1][-1]
end

unique_paths(5, 5)

def unique_paths_1d(m, n)
  current_row = [1] * n
  prev_row = current_row

  (1...m).each do |_i|
    (1...n).each do |j|
      current_row[j] = current_row[j - 1] + prev_row[j]
    end
    current_row, prev_row = prev_row, current_row
  end
  prev_row[-1]
end

def unique_paths_math(m, n)
  choices = Array.new(m + n - 2) { |i| i + 1 }
  choices.combination(m - 1).size
end

