# frozen_string_literal: true

require_relative '../test'

# 1. Fixed size sliding window
#
# Given an array of integers arr and an integer k,
# return the maximum sum of any contiguous subarray of size k.
def max_sum_subarray(nums, k)
  return 0 if nums.empty?

  return 0 if k > nums.length

  max_sum = 0
  current_sum = nums[0...k].sum

  (0..nums.length - k).each do |i|
    current_sum = current_sum - nums[i - 1] + nums[i + k - 1] if i.positive?
    max_sum = [max_sum, current_sum].max
  end

  max_sum
end

# 1. Variable size sliding window
# Given an array of positive integers nums and an integer target,
# return the minimal length of a contiguous subarray of which the sum is greater than or equal to target.
# If no such subarray exists, return 0.
def min_subarray_length(nums, target)
  left = 0
  min_len = Float::INFINITY
  window_sum = 0

  nums.each_with_index do |num, right|
    window_sum += num

    while window_sum >= target
      min_len = [min_len, right - left + 1].min
      window_sum -= nums[left]
      left += 1
    end
  end

  min_len == Float::INFINITY ? 0 : min_len
end

# Given a string s, return the length of the longest substring without repeating characters.
def length_of_longest_substring(string)
  return 0 if string.empty?

  left = 0
  max_len = 0
  seen = {}

  string.each_char.with_index do |char, right|
    left = seen[char] + 1 if seen[char] && seen[char] >= left

    seen[char] = right
    max_len = [max_len, right - left + 1].max
  end

  max_len
end

# Given a string s and an integer k, return the length of the longest substring
# that contains at most k distinct characters.
def longest_k_substring(string, k)
  left = 0
  max_len = 0
  char_size = Hash.new(0)
  max_freq = 0

  string.each_char.with_index do |char, right|
    char_size[char] += 1
    max_freq = [max_freq, char_size[char]].max

    if (right - left + 1) - max_freq > k
      char_size[string[left]] -= 1
      left += 1
    end

    max_len = [max_len, right - left + 1].max
  end
  max_len
end

# Given a string s and an integer k, you may replace at most k characters in the string
# so that all characters in the resulting substring are the same.
# Return the length of the longest such substring.
def longest_repeating_char_replacement(string, k)
  left = 0
  max_len = 0
  char_size = Hash.new(0)

  string.each_char.with_index do |char, right|
    char_size[char] += 1
    max_freq_char = char_size.max_by { |_k, v| v }[0]

    while (right - left + 1) - char_size[max_freq_char] > k
      char_size[string[left]] -= 1
      left += 1
    end
    max_len = [max_len, right - left + 1].max
  end

  max_len
end

# Given two strings s and t, return the smallest substring of s that contains all the characters of t,
# including duplicates. If no such window exists, return an empty string.
def smallest_window_containing_all_chars(s, t)
  return '' if t.empty? || s.empty?

  return '' if t.length > s.length

  need = Hash.new(0)
  t.each_char { |c| need[c] += 1 }

  window = Hash.new(0)
  have = 0
  need_size = need.size

  res = [-1, -1]
  res_len = Float::INFINITY
  left = 0

  s.each_char.with_index do |char, right|
    window[char] += 1

    have += 1 if need.key?(char) && window[char] == need[char]

    while have == need_size
      # update result if smaller window found
      if (right - left + 1) < res_len
        res = [left, right]
        res_len = right - left + 1
      end

      window[s[left]] -= 1

      have -= 1 if need.key?(s[left]) && window[s[left]] < need[s[left]]
      left += 1
    end
  end

  start, finish = res
  res_len == Float::INFINITY ? '' : s[start..finish]
end

def test_max_sub_array
  test_equal(max_sum_subarray([2, 1, 5, 1, 3, 2], 3), 9)
  test_equal(max_sum_subarray([2, 3, 4, 1, 5], 2), 7)
end

def test_min_sub_array
  test_equal(min_subarray_length([2, 3, 1, 2, 4, 3], 7), 2)
  test_equal(min_subarray_length([1, 2, 3, 4, 5], 15), 5)
  test_equal(min_subarray_length([1, 1, 1, 1, 1], 11), 0)
  test_equal(min_subarray_length([1, 4, 4], 4), 1)
end

def test_longest_substring
  test_equal(length_of_longest_substring('abcabcbb'), 3)
  test_equal(length_of_longest_substring('bbbbb'), 1)
  test_equal(length_of_longest_substring('pwwkew'), 3)
  test_equal(length_of_longest_substring(''), 0)
end

def test_longest_k_substring
  test_equal(longest_k_substring('eceba', 2), 3)
  test_equal(longest_k_substring('aa', 1), 2)
  test_equal(longest_k_substring('abcadcacacaca', 3), 11)
end

def test_longest_repeating_char_replacement
  test_equal(longest_repeating_char_replacement('ABAB', 2), 4)
  test_equal(longest_repeating_char_replacement('AABABBA', 1), 4)
end

def test_smallest_window_containing_all_chars
  test_equal(smallest_window_containing_all_chars('ADOBECODEBANC', 'ABC'), 'BANC')
  test_equal(smallest_window_containing_all_chars('a', 'a'), 'a')
  test_equal(smallest_window_containing_all_chars('a', 'b'), '')
  test_equal(smallest_window_containing_all_chars('a', 'aa'), '')
end

# test_max_sub_array
# test_min_sub_array
# test_longest_substring
# test_longest_k_substring
# test_longest_repeating_char_replacement
test_smallest_window_containing_all_chars
