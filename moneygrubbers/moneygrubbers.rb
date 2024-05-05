# - You want to buy apples and head to an apple store.
# - The store offers two pricing options:
#   - Buy one apple for $1.75.
#   - Choose from multiple pricing schemes where you buy a certain number of apples at a set price:
#     - Example: Three apples for $4.00, or two apples for $2.50.
# - Your objective is to purchase at least k apples while spending as little money as possible.
#
# Input:
# - Read test cases until there's no more input.
# - Each test case consists of the following lines:
#   - A line containing the price for buying one apple, followed by the number m of pricing schemes for this test case
#   m is at most 20.
#   - m lines, each providing a number n and total price p for purchasing n apples. n ranges between 1 and 100.
#   - A line containing integers, where each integer k ranges between 0 and 100 and
#   represents the desired number of apples to buy.
# Constraints:
# - Each price in the input is a floating-point number with exactly two decimal digits.
# Example:
# Given the problem description and the example pricing schemes, suppose we want to determine the minimum price for
# buying at least one apple and at least four apples, respectively. Here’s the input for this test case:
# ```
# 1.75 2
# 3 4.00
# 2 2.50
# 1 4
# ```
# Output:
# For each test case, output the following:
# - A line containing Case c:, where c is the number of the test case starting at 1.
# - For each integer k, a line containing Buy k for $d, where d is the cheapest cost for
# which we can buy at least k apples.
# Example Output:
# ```
# Case 1:
# Buy 1 for $1.75
# Buy 4 for $5.00
# ```

# using recursion and memoization
def solve_recursion_k(apples_in_each_scheme, prices, number_of_schemes, unit_price, number_of_apples, memo)
  return memo[number_of_apples] if memo[number_of_apples] != -1

  if number_of_apples.zero?
    memo[number_of_apples] = 0
    return 0
  end

  result = solve_recursion_k(
    apples_in_each_scheme,
    prices,
    number_of_schemes,
    unit_price,
    number_of_apples - 1,
    memo
  )

  best = result + unit_price

  (0...number_of_schemes).each do |i|
    if number_of_apples - apples_in_each_scheme[i] >= 0
      result = solve_recursion_k(
        apples_in_each_scheme,
        prices,
        number_of_schemes,
        unit_price,
        number_of_apples - apples_in_each_scheme[i],
        memo
      )
      best = [best, result + prices[i]].min
    end
  end
  memo[number_of_apples] = best
  best
end

def solve(apples_in_each_scheme, prices, number_of_schemes, unit_price, number_of_apples, memo)
  best = solve_recursion_k(apples_in_each_scheme, prices, number_of_schemes, unit_price, number_of_apples, memo)
  (number_of_apples + 1...200).each do |i|
    best = [best, solve_recursion_k(apples_in_each_scheme, prices, number_of_schemes, unit_price, i, memo)].min
  end
  best
end

def main
  test_case = 0
  apples_in_each_scheme = Array.new(20, 0)
  prices = Array.new(20, 0)
  memo = Array.new(200, -1)
  line = gets.chomp

  while line != '-1'
    test_case += 1
    array_line = line.split(' ')
    unit_price = array_line[0].to_f
    number_of_schemes = array_line[1].to_i
    (0...number_of_schemes).each do |i|
      line = gets.chomp.split(' ')
      apples_in_each_scheme[i] = line[0].to_i
      prices[i] = line[1].to_f
    end
    apples_to_buy = gets.chomp.split(' ').map(&:to_i)
    puts "Case #{test_case}:"
    apples_to_buy.each do |apples|
      result = solve(
        apples_in_each_scheme,
        prices,
        number_of_schemes,
        unit_price,
        apples,
        memo
      )
      puts "Buy #{apples} for $#{result}"
    end
    line = gets.chomp
  end
end

main
