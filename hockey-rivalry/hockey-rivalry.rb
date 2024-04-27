# The Geese and the Hawks each played a series of games, where each game resulted
# in either a win (W) or a loss (L) for one of the teams. We have information about
# the outcomes of these games and the number of goals scored by each team in each game.
# However, we don't know which team played against which in each game.

# Our goal is to figure out the maximum total number of goals that could have been scored
# in the games where the Geese played against the Hawks. These games are called rivalry game

# Input:
# The input contains one test case, the information for which is spread over five lines as follows:

# The first line contains n, the number of games that each team played. n is between 1 and 1,000.
# The second line contains a string of length n, where each character is a W (win) or L (loss).
# This line tells us the outcome of each game played by the Geese.
# For example, WLL means that the Geese won their first game, lost their second game,
# and lost their third game.
# The third line contains n integers, giving the number of goals scored in each game by the Geese.
# For example, 4 1 2 means that the Geese scored four goals in their first game,
# one goal in their second game, and two goals in their third game.
# The fourth line is like the second, but it tells us the outcome of each game for the Hawks.
# The fifth line is like the third, but it tells us the number of goals scored in each game by the Hawks.

# Output:
# The output is a single integer: the maximum number of goals scored in possible rivalry games.

# using recursion with memoization
def solve_recursion(geese_outcomes, hawks_outcomes, geese_goals, hawks_goals, i, j, memo) 
  return memo[i][j] unless memo[i][j] == -1

  if i.zero? || j.zero?
    memo[i][j] = 0
    return 0
  end

  first = 0
  if (geese_outcomes[i] == 'W' && hawks_outcomes[j] == 'L' && geese_goals[i] > hawks_goals[j]) ||
     (geese_outcomes[i] == 'L' && hawks_outcomes[j] == 'W' && geese_goals[i] < hawks_goals[j])
    first = solve_recursion(
      geese_outcomes,
      hawks_outcomes,
      geese_goals,
      hawks_goals,
      i - 1,
      j - 1,
      memo
    ) + geese_goals[i] + hawks_goals[j]
  end

  second = solve_recursion(
    geese_outcomes,
    hawks_outcomes,
    geese_goals,
    hawks_goals,
    i - 1,
    j - 1,
    memo
  )
  third = solve_recursion(
    geese_outcomes,
    hawks_outcomes,
    geese_goals,
    hawks_goals,
    i - 1,
    j,
    memo
  )
  fourth = solve_recursion(
    geese_outcomes,
    hawks_outcomes,
    geese_goals,
    hawks_goals,
    i,
    j - 1,
    memo
  )

  memo[i][j] = [first, second, third, fourth].max
  memo[i][j]
end

def solve_dynamic(geese_outcomes, hawks_outcomes, geese_goals, hawks_goals, n)
  dp = Array.new(n + 1) { Array.new(n + 1, 0) }
  previous = Array.new(n + 1, 0)
  current = Array.new(n + 1, 0)
  (1..n).each do |i|
    (1..n).each do |j|
      if (geese_outcomes[i] == 'W' && hawks_outcomes[j] == 'L' && geese_goals[i] > hawks_goals[j]) ||
         (geese_outcomes[i] == 'L' && hawks_outcomes[j] == 'W' && geese_goals[i] < hawks_goals[j])
        first = previous[j - 1] + geese_goals[i] + hawks_goals[j]
      else
        first = 0
      end
      second = dp[i - 1][j - 1]
      third = previous[j]
      fourth = current[j - 1]
      current[j] = [first, second, third, fourth].max
    end
    previous = current
  end
  current[n]
end

def main
  n = gets.strip.to_i
  geese_outcomes = gets.strip.split('').unshift('')
  geese_goals = gets.strip.split(' ').map(&:to_i).unshift(0)
  hawks_outcomes = gets.strip.split('').unshift('')
  hawks_goals = gets.strip.split(' ').map(&:to_i).unshift(0)
  # memo = Array.new(n + 1) { Array.new(n + 1, -1) }
  # result = solve_recursion(
  #   geese_outcomes,
  #   hawks_outcomes,
  #   geese_goals,
  #   hawks_goals,
  #   n,
  #   n,
  #   memo
  # )
  result = solve_dynamic(geese_outcomes, hawks_outcomes, geese_goals, hawks_goals, n)
  puts result
end

main
