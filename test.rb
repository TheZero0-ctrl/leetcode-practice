def test_equal(result, expected)
  if result == expected
    puts 'pass'
  else
    puts "fail: expected #{expected} but got #{result}"
  end
end
