# Given two types of burgers that take m and n  minutes to eat, and a total eating time of t minutes,
# find the maximum number of burgers that can be consumed if the time cannot be exactly
# divided by the eating times of the burgers.
# Remaining time will be used for drinking beers
# Input:
# Continuously read test cases until there's no more input. Each test case consists
# of a line with three integers: m (minutes to eat the first type of burger), n
# (minutes to eat the second type of burger), and t (total minutes available for eating and drinking).
# Each of the values m, n, and t will be less than 10,000.

# Output:
# For each test case:
# - If can use exactly t minutes to eat burgers, output the maximum number of burgers we can eat.
# - If it's not possible to use exactly t  minutes, output two numbers: the maximum number
# of burgers we can eat by maximizing burger eating time, and the number of minutes
# left (which will be used for drinking beer), separated by a space.

# Using Memoization and Recursion
def solve_t(m, n, t, memo)
  return memo[t] if memo[t] != -2

  if t.zero?
    memo[t] = 0
    return 0
  end

  if t >= m
    first = solve_t(m, n, t - m, memo)
  else
    first = -1
  end

  if t >= n
    second = solve_t(m, n, t - n, memo)
  else
    second = -1
  end

  if first == -1 && second == -1
    memo[t] = -1
    -1
  else
    memo[t] = [first, second].max + 1
    [first, second].max + 1
  end
end

def solve(m, n, t)
  memo = Array.new(1000, -2)
  result = solve_t(m, n, t, memo)

  if result >= 0
    puts result
  else
    i = t - 1
    result = solve_t(m, n, i, memo)
    while result == -1
      i -= 1
      result = solve_t(m, n, i, memo)
    end
    puts "#{result} #{t - i}"
  end
end

# Using Dynamic Programming
def solve_dynamic(m, n, t)
  dp = Array.new(t)
  dp[0] = 0
  (1..t).each do |i|
    if i >= m
      first = dp[i - m]
    else
      first = -1
    end

    if i >= n
      second = dp[i - n]
    else
      second = -1
    end

    if first == -1 && second == -1
      dp[i] = -1
    else
      dp[i] = [first, second].max + 1
    end
  end
  result = dp[t]
  if result >= 0
    puts result
  else
    i = t - 1
    result = dp[i]
    while result == -1
      i -= 1
      result = dp[i]
    end
    puts "#{result} #{t - i}"
  end
end

def main
  line = gets.chomp
  while line != '-1'
    m, n, t = line.split(' ').map(&:to_i)
    solve_dynamic(m, n, t)
    line = gets.chomp
  end
end

main()
