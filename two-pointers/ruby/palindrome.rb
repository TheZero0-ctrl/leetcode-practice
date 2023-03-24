# @param {String} sentence
# @return {Boolean}
def palindrome?(sentence)
  sentence = sentence.downcase.gsub(/[^0-9a-z]/i, '')
  # Initialize two pointers at the start and end of the sentence
  left = 0
  right = sentence.length - 1

  # Compare characters at the two pointers and move them towards each other until they meet
  while left < right
    return false if sentence[left] != sentence[right]

    left += 1
    right -= 1
  end

  # If we've reached this point, the sentence is a palindrome
  true
end
